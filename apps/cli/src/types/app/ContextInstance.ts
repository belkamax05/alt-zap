import CommandInstance from './CommandInstance';
import ProgramInstance from './ProgramInstance';

class ContextInstance {
  public commands: CommandInstance[];
  public program: ProgramInstance;

  constructor(program: ProgramInstance) {
    this.commands = [];
    this.program = program;
  }

  addCommand(command: CommandInstance): void {
    this.commands.push(command);
    console.log(
      '[ContextInstance] command added. Length: ',
      this.commands.length,
    );
  }

  addCommandTop(command: CommandInstance): void {
    this.commands.unshift(command);
    console.log(
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
    console.log(
      '[ContextInstance] command removed. Length: ',
      this.commands.length,
    );
    return removedItem;
  };

  run = async (): Promise<void> => {
    const command = this.getFirstCommand();
    if (command) {
      console.log('[ContextInstance] command run', command.name);
      await command.run({
        program: this.program,
        context: this,
      });
      this.removeFirstCommand();
    }
    if (this.commands.length > 0) {
      console.log('[ContextInstance] remain');
      return await this.run();
    }
  };
}

export default ContextInstance;
