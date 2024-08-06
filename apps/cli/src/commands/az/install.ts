import Command from '../../types/app/Command';
import logCommand from '../../utils/logCommand';

const install: Command = ({ command }) => {
  logCommand(`azInstallPlugin ${command.args.join(' ')}`);
};

export default install;
