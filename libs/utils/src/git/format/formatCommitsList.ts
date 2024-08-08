import { GitCommitListItem } from '@az/types';

const formatCommitsList = (commits: GitCommitListItem[]) =>
  commits.map(({ hash, message }) => `${hash} - ${message}`).join('\n');

export default formatCommitsList;
