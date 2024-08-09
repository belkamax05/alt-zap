import CommandInstance from './CommandInstance';
import ProgramInstance from './ProgramInstance';

class ContextInstance {
  public commands: CommandInstance[];
  public program: ProgramInstance;

  constructor(program: ProgramInstance) {
    this.commands = [];
    this.program = program;
  }

  get log() {
    return this.program.log;
  }
  get debug() {
    return this.program.debug;
  }

  addCommand(command: CommandInstance): void {
    this.commands.push(command);
    this.debug.debug(
      '[ContextInstance] command added. Length: ',
      this.commands.length,
    );
  }

  addCommandTop(command: CommandInstance): void {
    this.commands.unshift(command);
    this.debug.debug(
      '[ContextInstance] command added. Length: ',
      this.commands.length,
    );
  }

  instantCommand = async (command: CommandInstance) =>
    await command.run({
      program: this.program,
      context: this,
    });

  getFirstCommand = () => this.commands[0];

  removeFirstCommand = () => {
    const removedItem = this.commands.shift();
    this.debug.debug(
      '[ContextInstance] command removed. Length: ',
      this.commands.length,
    );
    return removedItem;
  };

  run = async (): Promise<void> => {
    const command = this.getFirstCommand();
    if (command) {
      this.debug.debug('[ContextInstance] command run', command.name);
      await command.run({
        program: this.program,
        context: this,
      });
      this.removeFirstCommand();
    }
    if (this.commands.length > 0) {
      this.debug.debug('[ContextInstance] remain');
      return await this.run();
    }
  };
}

export default ContextInstance;
