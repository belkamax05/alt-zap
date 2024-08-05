import ContextInstance from '../types/app/ContextInstance';
import ProgramInstance from '../types/app/ProgramInstance';
import commandManager from './commandManager';

class ContextManager {
  run = async (
    program: ProgramInstance,
    context: ContextInstance,
  ): Promise<void> => {
    // console.log('ContextManager run', program.argv);
    const command = context.takeCommand();
    if (command) {
      await commandManager.run(program, context, command);
    }
    const remainCommands = context.getCommands();
    if (remainCommands.length > 0) {
      // console.log('Remain: ', remainCommands);
      return await this.run(program, context);
    }
  };
}

const contextManager = new ContextManager();

export default contextManager;
