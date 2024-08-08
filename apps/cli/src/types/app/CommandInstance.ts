import { CommandBaseArgs } from '@az/types';
import minimist from 'minimist';
import alias from '../../config/alias';
import importCommand from '../../utils/importCommand';
import CommandOptions from './CommandOptions';

class CommandInstance {
  public name: string;
  public args: CommandBaseArgs;

  constructor(argvOrArgs?: string[] | CommandBaseArgs) {
    this.args = Array.isArray(argvOrArgs) ? minimist(argvOrArgs) : argvOrArgs;
    const [argsName] = this.args._;
    const nameSelected = alias[argsName as keyof typeof alias] || argsName;
    this.name = nameSelected;
  }

  run = async ({
    program,
    context,
  }: Omit<CommandOptions, 'command'>): Promise<void> => {
    const runCmd = await importCommand(this.name);
    await runCmd?.({
      program,
      context,
      command: this,
    } as CommandOptions);
  };
}

export default CommandInstance;
