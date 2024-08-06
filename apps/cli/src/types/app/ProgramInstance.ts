import CommandInstance from './CommandInstance';
import ContextInstance from './ContextInstance';

class ProgramInstance {
  public argv: string[];
  constructor(argv: string[]) {
    this.argv = argv;
  }

  run = async () => {
    // console.log('ProgramManager run', this.instance.argv);
    const context = new ContextInstance();
    const [command, ...args] = this.argv;
    context.addCommand(new CommandInstance(command, args));
    await context.run(this);
  };
}

export default ProgramInstance;
