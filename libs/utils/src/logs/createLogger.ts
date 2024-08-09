import LoggerInstance from './LoggerInstance';
import { LoggerInstanceParams } from './types/LoggerInstanceParams';

const createLogger = (params: LoggerInstanceParams): LoggerInstance => {
  const logger = new LoggerInstance(params);
  return logger;
};

export default createLogger;
