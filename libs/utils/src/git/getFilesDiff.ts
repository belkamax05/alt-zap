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
  /**
   * filter files by diff-filter
   * @default undefined - no filter
   * @see https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---diff-filterACDMRTUXB82308203
   * @example 'ACDMRTUXB'
   */
  diffFilter?: 'A' | 'C' | 'D' | 'M' | 'R' | 'T' | 'U' | 'X' | 'B';
}

const getFilesDiff = async ({
  cached,
  removed,
  diffFilter,
}: GetFilesDiffProps) => {
  const cachedStr = cached ? ' --cached' : '';
  const removedStr = removed
    ? ' --diff-filter=D'
    : diffFilter
      ? ` --diff-filter=${diffFilter}`
      : '';
  const { stdout } = await execAsync(
    `git diff --name-only ${removedStr}${cachedStr}`,
  );
  return stdout.trim().split('\n').filter(Boolean);
};
export default getFilesDiff;
