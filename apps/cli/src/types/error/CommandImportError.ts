class CommandImportError extends Error {
  public command: string;
  constructor(command: string) {
    super(`Error importing command: ${command}`);
    this.command = command;
    this.name = 'CommandImportError';
  }
}

export default CommandImportError;
