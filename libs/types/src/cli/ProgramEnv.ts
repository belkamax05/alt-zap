export interface ProgramEnv extends NodeJS.ProcessEnv {
  PATH: string;
  PWD: string;
  SHELL: string;
  USER: string;
  HOME: string;
  AZ_DIR: string;
  AZ_CONFIG_DIR: string;
  AZ_C_BOLD: string;
  AZ_C_CYAN: string;
  AZ_C_DARK_RED: string;
  AZ_C_MAGENTA: string;
  AZ_C_RESET: string;
  AZ_C_YELLOW: string;
  AZ_DEBUG: string;
}
