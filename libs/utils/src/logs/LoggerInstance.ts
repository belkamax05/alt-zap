import { log } from '@clack/prompts';
import noop from '../helpers/utils/noop';
import { LoggerInstanceMethods as Methods } from './types/LoggerInstanceMethods';
import { LoggerInstanceParams as Params } from './types/LoggerInstanceParams';

type MethodName = keyof Methods;
type InnerMethodName = `_${MethodName}`;

class LoggerInstance {
  public enabled: boolean;
  public preffix: string;
  private _overrides: Methods;
  //   private _debug: Methods['debug'];
  private _methodsInitialised: Partial<Record<MethodName, boolean>> = {};
  private _methodsCache: Partial<Record<MethodName, Methods[MethodName]>> = {};

  constructor(params: Params) {
    const { enabled = true, preffix = '', overrides } = params;
    this.enabled = enabled;
    this._overrides = overrides || {};
    this._methodsInitialised = {};
    this.preffix = preffix;
  }

  private preffixMessage = (message?: string) =>
    message ? `${this.preffix} ${message}` : this.preffix;
  private getMethod = <K extends MethodName>(method: K): Methods[K] => {
    if (!this._methodsInitialised[method]) {
      this._methodsInitialised[method] = true;
      this._methodsCache[method] = this.enabled
        ? this._overrides[method] || this[`_${method}` as InnerMethodName]
        : noop;
    }
    return this._methodsCache[method] as Methods[K];
  };

  setEnabled = (enabled: boolean) => {
    this.enabled = enabled;
    this._methodsInitialised = {};
  };
  enable = () => this.setEnabled(true);
  disable = () => this.setEnabled(false);

  private _clear: Methods['clear'] = () => console.clear();
  get clear() {
    return this.getMethod('clear');
  }

  private _log: Methods['log'] = (...args) =>
    console.log(this.preffix, ...args);
  get log() {
    return this.getMethod('log');
  }

  private _debug: Methods['debug'] = (...args) =>
    console.debug(this.preffix, ...args);
  get debug() {
    return this.getMethod('debug');
  }

  private _info: Methods['info'] = (message) =>
    log.info(this.preffixMessage(message));
  get info() {
    return this.getMethod('info');
  }

  private _message: Methods['message'] = (message, ...args) =>
    log.message(this.preffixMessage(message), ...args);
  get message() {
    return this.getMethod('message');
  }
}

export default LoggerInstance;

// const c: LoggerInstance;

/**
 * clear?: typeof console.clear;
 * debug?: typeof console.debug;
 * info?: typeof log.info;
 * message?: typeof log.message;
 */
