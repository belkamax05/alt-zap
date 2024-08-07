import getLocalCommits from '@az/utils/git/getLocalCommits';
import { log } from '@clack/prompts';
import Command from '../../types/app/Command';

const localCommits: Command = async () => {
  const commits = await getLocalCommits();
  log.message(commits);
};

export default localCommits;
