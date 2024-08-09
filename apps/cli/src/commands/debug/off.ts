import Command from '../../types/app/Command';
import CommandInstance from '../../types/app/CommandInstance';

const debugOff: Command = async ({ context }) => {
  context.addCommand(new CommandInstance(['config/set', 'debug', 'false']));
};

export default debugOff;
