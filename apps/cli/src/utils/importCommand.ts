import CommandImportError from '../types/error/CommandImportError';

const importCommand = async (command: string) => {
  try {
    const { default: module } = await import(`../commands/${command}.ts`);
    return module;
  } catch (error) {
    console.error(error);
    throw new CommandImportError(command);
  }
};

export default importCommand;
