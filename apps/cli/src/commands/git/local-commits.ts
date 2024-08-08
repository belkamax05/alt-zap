import formatCommitsList from '@az/utils/git/format/formatCommitsList';
import getLocalCommits from '@az/utils/git/getLocalCommits';
import { log } from '@clack/prompts';
import Command from '../../types/app/Command';

const localCommits: Command = async () => {
  const commits = await getLocalCommits();

  if (commits.length === 0) {
    log.info('No local commits found');
    return;
  }
  log.info('Local commits:');
  log.message(formatCommitsList(commits));
};

export default localCommits;
