import Command from '../types/app/Command';
import logCommand from '../utils/logCommand';

const build: Command = () => {
  logCommand('az cli-build');
  //TODO add scripts support to "yarn <script>"
  //TODO compile via internal script, not az zsh files
};

export default build;
