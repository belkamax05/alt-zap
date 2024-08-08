import { GitCommitListItem } from '@az/types';
import execAsync from '../exec/execAsync';
import getBranchDescription from './getBranchDescription';

interface GetLocalCommitsProps {
  /** name of branch, if not passed - uses "getBranchDescription" function */
  name?: string;
}

const getLocalCommits = async (
  options?: GetLocalCommitsProps,
): Promise<GitCommitListItem[]> => {
  let { name } = options || {};
  if (!name) {
    const { name: branchDescriptionName } = await getBranchDescription();
    name = branchDescriptionName;
  }
  const commitsCmd = `git log ${name} --not --remotes --oneline`;
  const { stdout: commits } = await execAsync(commitsCmd);
  return commits
    .trim()
    .split('\n')
    .filter(Boolean)
    .map((commit): GitCommitListItem => {
      const [hash, message] = commit.split(' ');
      return { hash, message };
    });
};

export default getLocalCommits;
