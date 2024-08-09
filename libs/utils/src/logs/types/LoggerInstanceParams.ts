import { LoggerInstanceMethods } from './LoggerInstanceMethods';

export interface LoggerInstanceParams {
  enabled?: boolean;
  preffix?: string;
  overrides?: LoggerInstanceMethods;
}
