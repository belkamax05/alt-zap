class CommandImportError extends Error {
  constructor(command: string) {
    super(`Error importing command: ${command}`);
    this.name = 'CommandImportError';
  }
}

export default CommandImportError;
