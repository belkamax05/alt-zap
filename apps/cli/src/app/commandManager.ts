import CommandInstance from '../types/app/CommandInstance';
import CommandOptions from '../types/app/CommandOptions';
import ContextInstance from '../types/app/ContextInstance';
import ProgramInstance from '../types/app/ProgramInstance';

class CommandManager {
  run = async (
    program: ProgramInstance,
    context: ContextInstance,
    command: CommandInstance,
  ): Promise<void> => {
    // console.log('CommandManager run', program.argv);
    // const [command, ...args] = program.argv;
    // const instance = new CommandInstance(command, args);
    const { default: runCmd } = await import(`../commands/${command.name}.ts`);
    await runCmd({
      program,
      context,
      command,
    } as CommandOptions);
  };
}

const commandManager = new CommandManager();

export default commandManager;
