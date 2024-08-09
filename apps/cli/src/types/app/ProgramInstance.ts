import { AzConfig, ProgramBaseArgs, ProgramEnv } from '@az/types';
import getUserConfig from '@az/utils/config/getUserConfig';
import LoggerInstance from '@az/utils/logs/LoggerInstance';
import colors from 'colors';
import minimist from 'minimist';
import CommandInstance from './CommandInstance';
import ContextInstance from './ContextInstance';

class ProgramInstance {
  private _userConfig: AzConfig;
  private _env: ProgramEnv;
  private _log: LoggerInstance;
  private _debug: LoggerInstance;

  readonly argv: string[];
  readonly args: ProgramBaseArgs;

  public preffix: string = colors.cyan('⌥⎇ cli ');

  constructor(argv: string[]) {
    this.argv = argv;
    this.args = minimist(this.argv);
    this.contexts = [];

    const context = new ContextInstance(this);
    const command = new CommandInstance(argv);

    context.addCommand(command);
    this.addContext(context);

    this.debug.log('[ProgramInstance] Argv:', this.argv);
    this.debug.log('[ProgramInstance] Args:', this.args);
  }

  get userConfig() {
    if (!this._userConfig)
      this._userConfig = getUserConfig({ configPath: this.env.AZ_CONFIG_DIR });
    return this._userConfig;
  }
  set userConfig(config: AzConfig) {
    this._userConfig = config;
  }
  get env() {
    if (!this._env) this._env = process.env as ProgramEnv;
    return this._env;
  }

  get log() {
    if (!this._log)
      this._log = new LoggerInstance({
        enabled: true,
        preffix: colors.cyan('[AltZap:cli]:'),
      });
    return this._log;
  }
  get debug() {
    if (!this._debug)
      this._debug = new LoggerInstance({
        enabled: this.userConfig.debug,
        preffix: colors.magenta('⌥⎇:cli  🚧'),
      });
    return this._debug;
  }

  contexts: ContextInstance[];

  addContext = (context: ContextInstance) => {
    this.contexts.push(context);
    this.debug.debug('context added. Length: ', this.contexts.length);
  };
  getFirstContext = () => this.contexts[0];

  removeFirstContext = () => {
    const removedItem = this.contexts.shift();
    this.debug.debug('context removed. Length: ', this.contexts.length);
    return removedItem;
  };

  run = async () => {
    this.debug.debug('run. Argv: ', this.argv);

    const context = this.getFirstContext();
    if (context) {
      this.debug.debug('context run');
      await context.run();
      this.removeFirstContext();
    }
    if (this.contexts.length > 0) {
      this.debug.debug('remain');
      return await this.run();
    }
  };
}

export default ProgramInstance;
