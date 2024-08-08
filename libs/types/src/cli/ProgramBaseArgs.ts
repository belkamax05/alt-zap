import { ParsedArgs } from 'minimist';

interface AdditionalArgs {
  help: boolean;
  version: boolean;
  verbose: boolean;
  debug: boolean;
  quiet: boolean;
  silent: boolean;
  color: boolean;
  noColor: boolean;
  noInteractive: boolean;
  yes: boolean;
  no: boolean;
  force: boolean;
  dryRun: boolean;
  json: boolean;
  project: string;
  workspace: string;
  cwd: string;
  args: string[];
  unknownArgs: string[];
  [key: string]: any;
}

export interface ProgramBaseArgs extends ParsedArgs, Partial<AdditionalArgs> {}
