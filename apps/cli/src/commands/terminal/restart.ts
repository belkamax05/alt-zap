import Command from '../../types/app/Command';
import logCommand from '../../utils/logCommand';

const restart: Command = ({ command: { argv } }) => {
  const [_, ...childArgs] = argv;
  console.log('before...', { argv, childArgs });
  logCommand(('clear && zsh ' + childArgs.join(' ')).trim());
  console.log('after...');
};

export default restart;
