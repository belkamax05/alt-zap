import Command from '../types/app/Command';
import logCommand from '../utils/logCommand';

const here: Command = () => {
  logCommand(`cd ${process.env['AZ_ROOT']}`);
};

export default here;
