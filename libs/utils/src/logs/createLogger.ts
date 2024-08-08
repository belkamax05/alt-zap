interface LoggerInstance {
  info: (message: string) => void;
  error: (message: string) => void;
  warn: (message: string) => void;
  debug: (message: string) => void;
}

interface CreateLoggerParams {}
const createLogger = (params: CreateLoggerParams): LoggerInstance => {
  return {
    info: console.info,
    error: console.error,
    warn: console.warn,
    debug: console.debug,
  };
};
