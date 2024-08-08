import execCommit from '@az/utils/git/execCommit';
import getBranchDescription from '@az/utils/git/getBranchDescription';
import getFilesDiff from '@az/utils/git/getFilesDiff';
import { log, text } from '@clack/prompts';
import colors from 'colors';
import Command from '../../types/app/Command';

const commit: Command = async ({ command }) => {
  const [argsMessage] = command.args;

  const stagedFiles = await getFilesDiff({ cached: true });
  if (stagedFiles.length === 0) {
    const unstagedFiles = await getFilesDiff({});
    const unstagedLen = unstagedFiles.length;
    const unstagedMessage =
      unstagedLen > 0
        ? ` ${colors.yellow(String(unstagedLen))} Unstaged files detected.`
        : '';
    log.info(`No staged files for commit.${unstagedMessage}`);
    return;
  }

  const { name, isFlow, flow, ticketNumber } = await getBranchDescription();
  const flowDetectedMessage = isFlow ? ` (${colors.cyan('Flow')})` : '';
  const messageTitle = `Enter commit message for branch '${colors.yellow(name)}'${flowDetectedMessage}:`;
  const flowPreffix = isFlow ? `${ticketNumber}: ${flow.flowCategory}: ` : '';
  const initialValue = isFlow ? flowPreffix : argsMessage || '';
  const placeholder = isFlow ? `${flowPreffix}<message>` : '<message>';
  const message =
    argsMessage ||
    ((await text({
      message: messageTitle,
      placeholder,
      initialValue,
    })) as string);
  await execCommit({ message });
};

export default commit;
