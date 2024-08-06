import { text } from '@clack/prompts';
import colors from 'colors';
import Command from '../../types/app/Command';
import execAsync from '../../utils/exec/execAsync';
import getBranchDescription from '../../utils/git/getBranchDescription';

const commit: Command = async ({ command }) => {
  const [argsMessage] = command.args;
  const { name, isFlowBranch, flowCategory, ticketNumber } =
    await getBranchDescription();
  const flowDetectedMessage = isFlowBranch ? ` (${colors.cyan('Flow')})` : '';
  const messageTitle = `Enter commit message for branch '${colors.yellow(name)}'${flowDetectedMessage}:`;
  const flowPreffix = isFlowBranch ? `${ticketNumber}: ${flowCategory}: ` : '';
  const initialValue = isFlowBranch ? flowPreffix : argsMessage || '';
  const placeholder = isFlowBranch ? `${flowPreffix}<message>` : '<message>';
  const message =
    argsMessage ||
    ((await text({
      message: messageTitle,
      placeholder,
      initialValue,
    })) as string);
  await execAsync(`git commit -m "${message}"`);
};

export default commit;
