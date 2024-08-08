import execAsync from '../exec/execAsync';

export interface GetFilesDiffProps {
  /**
   * when set true, adds "--cached" for staged files
   * @default false - unstaged files
   */
  cached?: boolean;
  /**
   * when set true, adds "--diff-filter=D" for removed files
   * @default false - all files
   */
  removed?: boolean;
}

const getFilesDiff = async ({ cached, removed }: GetFilesDiffProps) => {
  const cachedStr = cached ? ' --cached' : '';
  const removedStr = removed ? ' --diff-filter=D' : '';
  const { stdout } = await execAsync(
    `git diff --name-only ${removedStr}${cachedStr}`,
  );
  return stdout.trim().split('\n').filter(Boolean);
};
export default getFilesDiff;
