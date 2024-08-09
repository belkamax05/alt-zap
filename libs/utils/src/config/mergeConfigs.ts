import { AzConfig } from '@az/types';
import merge from 'lodash/merge';

const mergeConfigs = (config1: AzConfig, config2: AzConfig) =>
  merge(config1, config2);

export default mergeConfigs;
