import alias from '../../config/alias';
import importCommand from '../../utils/importCommand';
import CommandOptions from './CommandOptions';
import ContextInstance from './ContextInstance';
import ProgramInstance from './ProgramInstance';

class CommandInstance {
  public name: string;
  public args: string[];

  constructor(name: string, args?: string[]) {
    const nameSelected = alias[name as keyof typeof alias] || name;
    // console.log('commandInstance', { name: nameSelected, args });
    this.name = nameSelected;
    this.args = args || [];
  }

  run = async (
    program: ProgramInstance,
    context: ContextInstance,
    command: CommandInstance,
  ): Promise<void> => {
    const runCmd = await importCommand(command.name);
    await runCmd?.({
      program,
      context,
      command,
    } as CommandOptions);
  };
}

export default CommandInstance;
