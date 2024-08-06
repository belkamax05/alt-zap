import CommandInstance from './CommandInstance';
import ProgramInstance from './ProgramInstance';

class ContextInstance {
  private commands: CommandInstance[];

  constructor() {
    this.commands = [];
  }

  addCommand(command: CommandInstance): void;
  addCommand(name: string, args?: string[]): void;
  addCommand(commandOrName: CommandInstance | string, args?: string[]): void {
    this.commands.push(
      typeof commandOrName === 'string'
        ? new CommandInstance(commandOrName, args)
        : commandOrName,
    );
  }

  addCommandTop(command: CommandInstance): void;
  addCommandTop(name: string, args?: string[]): void;
  addCommandTop(
    commandOrName: CommandInstance | string,
    args?: string[],
  ): void {
    this.commands.unshift(
      typeof commandOrName === 'string'
        ? new CommandInstance(commandOrName, args)
        : commandOrName,
    );
  }

  getCommands() {
    return this.commands;
  }

  takeCommand(): CommandInstance | undefined {
    return this.commands.shift();
  }
  takeCommandLast(): CommandInstance | undefined {
    return this.commands.pop();
  }

  run = async (program: ProgramInstance): Promise<void> => {
    // console.log('ContextManager run', program.argv);
    const command = this.takeCommand();
    if (command) {
      await command.run(program, this, command);
    }
    const remainCommands = this.getCommands();
    if (remainCommands.length > 0) {
      // console.log('Remain: ', remainCommands);
      return await this.run(program);
    }
  };
}

export default ContextInstance;
