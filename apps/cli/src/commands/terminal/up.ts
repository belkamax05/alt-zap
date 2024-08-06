import Command from '../../types/app/Command';
import logCommand from '../../utils/logCommand';

const up: Command = () => {
  logCommand(`cd ..`);
};

export default up;
