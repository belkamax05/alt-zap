import { text } from '@clack/prompts';
import { execSync } from 'child_process';
import colors from 'colors';
import Command from '../../types/app/Command';
import getBranchDescription from '../../utils/git/getBranchDescription';

const commit: Command = async ({ program }) => {
  const { name, isFlowBranch, flowCategory, ticketNumber } =
    await getBranchDescription();
  const flowDetectedMessage = isFlowBranch ? ` (${colors.cyan('Flow')})` : '';
  const messageTitle = `Enter commit message for branch '${colors.yellow(name)}'${flowDetectedMessage}:`;
  const flowPreffix = isFlowBranch ? `${ticketNumber}: ${flowCategory}: ` : '';
  const initialValue = isFlowBranch ? flowPreffix : '';
  const placeholder = isFlowBranch ? `${flowPreffix}<message>` : '<message>';
  const message = (await text({
    message: messageTitle,
    placeholder,
    initialValue,
  })) as string;
  execSync(`git commit -m "${message}"`);
};

export default commit;
