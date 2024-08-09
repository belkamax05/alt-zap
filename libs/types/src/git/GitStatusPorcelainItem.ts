import { GitStatusType } from './GitStatusType';

export interface GitStatusPorcelainItem {
  status: GitStatusType;
  file: string;
}
