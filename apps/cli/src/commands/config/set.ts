import { AzConfig } from '@az/types';
import defaultConfig from '@az/utils/config/defaultConfig';
import mergeConfigs from '@az/utils/config/mergeConfigs';
import fs from 'fs';
import cloneDeep from 'lodash/cloneDeep';
import path from 'path';
import Command from '../../types/app/Command';

const booleanParse = (value: string): boolean => {
  if (value === 'true') return true;
  if (value === 'false') return false;
  return Boolean(value);
};

const set: Command = async ({ program, context, command }) => {
  const currentConfig = program.userConfig;
  const [_, propName, propValue] = command.args._;
  console.log('set', program.args);
  const updatesInConfig: Partial<AzConfig> = {};
  if (propName && propValue) {
    const defaultValue = defaultConfig[propName];
    const fixedValue =
      typeof defaultValue === 'boolean' ? booleanParse(propValue) : propValue;
    console.log({ propValue, defaultValue, fixedValue });
    updatesInConfig[propName] = fixedValue;
  }
  const newConfig = mergeConfigs(cloneDeep(currentConfig), updatesInConfig);
  if (JSON.stringify(currentConfig) !== JSON.stringify(newConfig)) {
    program.userConfig = newConfig;
    await fs.promises.writeFile(
      path.join(program.env.AZ_CONFIG_DIR, 'user-config.json'),
      JSON.stringify(newConfig, null, 2),
    );
    // context.addCommand(new CommandInstance(['config/convert-to-zsh']));
  }
};

export default set;
