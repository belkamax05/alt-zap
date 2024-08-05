import CommandInstance from './CommandInstance';

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
}

export default ContextInstance;
