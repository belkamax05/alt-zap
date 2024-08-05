import CommandInstance from '../types/app/CommandInstance';
import ContextInstance from '../types/app/ContextInstance';
import ProgramInstance from '../types/app/ProgramInstance';
import contextManager from './contextManager';

class ProgramManager {
  private instance: ProgramInstance;
  constructor() {
    const argv = process.argv.slice(2);
    this.instance = new ProgramInstance(argv);
  }

  run = async () => {
    // console.log('ProgramManager run', this.instance.argv);
    const context = new ContextInstance();
    const [command, ...args] = this.instance.argv;
    context.addCommand(new CommandInstance(command, args));
    await contextManager.run(this.instance, context);
  };
}

const programManager = new ProgramManager();

export default programManager;
