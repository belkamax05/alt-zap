import CommandImportError from '../types/error/CommandImportError';

const importCommand = async (command: string) => {
  // console.log('command', { command });
  try {
    // const distDtsPath = path.join(
    //   __dirname,
    //   `apps/cli/src/commands/${command}.d.ts`,
    // );
    // const dtsExists = existsSync(distDtsPath);
    // if (!dtsExists) {
    //   p.log.error(`Command '${colors.yellow(command)}' is not available.`);
    //   return null;
    // }
    const { default: module } = await import(`../commands/${command}.ts`);
    return module;
  } catch (error) {
    console.error(error);
    throw new CommandImportError(command);
  }
};

export default importCommand;
