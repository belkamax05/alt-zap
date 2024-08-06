import * as p from '@clack/prompts';
import colors from 'colors';
import Command from '../../types/app/Command';
import getBranchDescription from '../../utils/git/getBranchDescription';

const commit: Command = async () => {
  const { name, isFlowBranch, flowCategory, ticketNumber } =
    await getBranchDescription();
  const flowDetectedMessage = isFlowBranch ? ` (${colors.cyan('Flow')})` : '';
  const messageTitle = `Enter commit message for branch '${colors.yellow(name)}'${flowDetectedMessage}:`;
  const flowPreffix = isFlowBranch ? `${ticketNumber}: ${flowCategory}: ` : '';
  const initialValue = isFlowBranch ? flowPreffix : '';
  const placeholder = isFlowBranch ? `${flowPreffix}<message>` : '<message>';
  console.log('TODO git commit with dialogs');
  const message = await p.text({
    message: messageTitle,
    placeholder,
    initialValue,
    // initialValue: 'Initial',
    // defaultValue: 'Default',
    // message: string;
    // placeholder?: string;
    // defaultValue?: string;
    // initialValue?: string;
    // name: 'message',
    // validate: (value: string) => value.length > 0,
  });
  console.log({
    message,
  });
};

export default commit;
