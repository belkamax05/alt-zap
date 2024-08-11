import defaultConfig from '@az/utils/config/defaultConfig';
import { log } from '@clack/prompts';
import colors from 'colors';
import fs from 'fs';
import Command from '../../types/app/Command';

const initialise: Command = async ({ command }) => {
  log.step(`Initialising configuration`);
  const { force: _force, f: _f } = command.args;
  const force = _force || _f;
  const { AZ_CONFIG_DIR: configDir } = process.env;
  if (!fs.existsSync(configDir)) {
    log.info(`Creating configuration directory ${configDir}`);
    fs.mkdirSync(configDir, { recursive: true });
  }
  const configFilePath = `${configDir}/user-config.json`;
  if (force || !fs.existsSync(configFilePath)) {
    log.info(`Creating configuration file '${colors.cyan(configFilePath)}'`);
    fs.writeFileSync(configFilePath, JSON.stringify(defaultConfig, null, 2));
  }
};

export default initialise;
