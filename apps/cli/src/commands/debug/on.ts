import Command from '../../types/app/Command';
import CommandInstance from '../../types/app/CommandInstance';

const debugOn: Command = async ({ context }) => {
  context.addCommand(new CommandInstance(['config/set', 'debug', 'true']));
};

export default debugOn;
