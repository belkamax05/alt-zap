import { CommandBaseArgs } from '@az/types';
import minimist from 'minimist';
import alias from '../../config/alias';
import importCommand from '../../utils/importCommand';
import CommandOptions from './CommandOptions';

class CommandInstance {
  readonly name: string;
  readonly argv: string[];
  readonly args: CommandBaseArgs;

  constructor(argv?: string[]) {
    this.argv = argv || [];
    this.args = minimist(this.argv);
    const [argsName] = this.args._;
    const nameSelected = alias[argsName as keyof typeof alias] || argsName;
    this.name = nameSelected;
  }

  run = async ({
    program,
    context,
  }: Omit<CommandOptions, 'command'>): Promise<void> => {
    program.debug.debug('[CommandInstance] run', {
      program,
      context,
      command: this,
    });
    const runCmd = await importCommand(this.name);
    await runCmd?.({
      program,
      context,
      command: this,
    } as CommandOptions);
  };
}

export default CommandInstance;
