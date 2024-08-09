import { log } from '@clack/prompts';

export interface LoggerInstanceMethods {
  log?: typeof console.log;
  debug?: typeof console.debug;
  clear?: typeof console.clear;
  info?: typeof log.info;
  message?: typeof log.message;
}
