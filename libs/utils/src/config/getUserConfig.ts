import { AzConfig } from '@az/types';
import fs from 'fs';
import cloneDeep from 'lodash/cloneDeep';
import path from 'path';
import defaultConfig from './defaultConfig';
import mergeConfigs from './mergeConfigs';

export interface GetUserConfigProps {
  configPath: string;
}

const getUserConfig = ({ configPath }: GetUserConfigProps): AzConfig => {
  const userConfigPath = configPath.endsWith('.json')
    ? configPath
    : path.join(configPath, 'user-config.json');
  if (!fs.existsSync(userConfigPath)) {
    fs.writeFileSync(
      userConfigPath,
      JSON.stringify(defaultConfig, null, 2),
      'utf-8',
    );
  }
  const userConfigFile = fs.readFileSync(userConfigPath, 'utf8');
  const userConfigJson = JSON.parse(userConfigFile) as AzConfig;
  const mergedConfig = mergeConfigs(cloneDeep(defaultConfig), userConfigJson);
  return mergedConfig;
};

export default getUserConfig;
