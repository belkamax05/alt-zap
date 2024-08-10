import Command from '../../types/app/Command';
import CommandInstance from '../../types/app/CommandInstance';

const debugOn: Command = async ({ context }) => {
  console.log('Hi');
  context.addCommand(new CommandInstance(['set', 'debug', 'true']));
};

export default debugOn;
