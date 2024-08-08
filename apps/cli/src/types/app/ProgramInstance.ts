import { ProgramBaseArgs } from '@az/types';
import minimist from 'minimist';
import CommandInstance from './CommandInstance';
import ContextInstance from './ContextInstance';

class ProgramInstance {
  readonly argv: string[];
  readonly args: ProgramBaseArgs;
  constructor(argv: string[]) {
    this.argv = argv;
    this.args = minimist(this.argv);
    console.log('[ProgramInstance] Argv:', this.argv);
    console.log('[ProgramInstance] Args:', this.args);
    this.contexts = [];

    const context = new ContextInstance(this);
    const command = new CommandInstance(argv);

    context.addCommand(command);
    this.addContext(context);
  }

  contexts: ContextInstance[];

  addContext = (context: ContextInstance) => {
    this.contexts.push(context);
    console.log(
      '[ProgramInstance] context added. Length: ',
      this.contexts.length,
    );
  };
  getFirstContext = () => this.contexts[0];

  removeFirstContext = () => {
    const removedItem = this.contexts.shift();
    console.log(
      '[ProgramInstance] context removed. Length: ',
      this.contexts.length,
    );
    return removedItem;
  };

  run = async () => {
    console.log('[ProgramInstance] run. Argv: ', this.argv);

    const context = this.getFirstContext();
    if (context) {
      console.log('[ProgramInstance] context run');
      await context.run();
      this.removeFirstContext();
    }
    if (this.contexts.length > 0) {
      console.log('[ProgramInstance] remain');
      return await this.run();
    }
    // console.log('ProgramManager run', this.instance.argv);
    // const [command, ...args] = this.argv;
    // context.addCommand(new CommandInstance(command, args));
    // await context.run(this);
  };
}

export default ProgramInstance;
