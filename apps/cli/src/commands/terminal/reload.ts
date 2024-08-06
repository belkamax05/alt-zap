import Command from '../../types/app/Command';
import logCommand from '../../utils/logCommand';

const reload: Command = () => {
  logCommand('clear && az load');
};

export default reload;
