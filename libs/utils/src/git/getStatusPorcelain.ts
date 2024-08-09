import { GitStatusPorcelainItem } from '@az/types';
import execAsync from '../exec/execAsync';

const getStatusPorcelain = async (): Promise<GitStatusPorcelainItem[]> => {
  const { stdout } = await execAsync('git status --porcelain');
  return stdout
    .trim()
    .split('\n')
    .map((line) => {
      const [status, file] = line.split(' ');
      return { status, file } as GitStatusPorcelainItem;
    });
};

export default getStatusPorcelain;
