import Command from '../../types/app/Command';
import logCommand from '../../utils/logCommand';

const restart: Command = () => {
  logCommand('clear && zsh');
};

export default restart;
