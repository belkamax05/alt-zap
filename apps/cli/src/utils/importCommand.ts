import * as p from '@clack/prompts';
import colors from 'colors';
import { existsSync } from 'fs';
import path from 'path';
import CommandImportError from '../types/error/CommandImportError';

const importCommand = async (command: string) => {
  try {
    const distDtsPath = path.join(
      __dirname,
      `apps/cli/src/commands/${command}.d.ts`,
    );
    const dtsExists = existsSync(distDtsPath);
    if (!dtsExists) {
      p.log.error(`Command '${colors.yellow(command)}' is not available.`);
      return null;
    }
    const { default: module } = await import(`../commands/${command}.ts`);
    return module;
  } catch (error) {
    console.error(error);
    throw new CommandImportError(command);
  }
};

export default importCommand;
