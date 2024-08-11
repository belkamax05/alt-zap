import { log } from '@clack/prompts';
import colors from 'colors';
import fs from 'fs';
import Command from '../../types/app/Command';

// const getEnviromentVariables = () => {
//   const { AZ_CONFIG_DIR, AZ_DIR, ...rest } = process.env;
//   return { AZ_CONFIG_DIR, AZ_DIR };
// };

const initialise: Command = async ({ command }) => {
  log.step(`Initialising configuration`);
  const { force: _force, f: _f } = command.args;
  const force = _force || _f;
  const { AZ_CONFIG_DIR: configDir } = process.env;
  const configFilePath = `${configDir}/config.json`;
  if (!fs.existsSync(configDir)) {
    log.info(`Creating configuration directory ${configDir}`);
    fs.mkdirSync(configDir, { recursive: true });
  }
  if (force || !fs.existsSync(configFilePath)) {
    log.info(`Creating configuration file '${colors.cyan(configFilePath)}'`);
    fs.writeFileSync(configFilePath, JSON.stringify({ temp: true }, null, 2));
  }
};

export default initialise;
