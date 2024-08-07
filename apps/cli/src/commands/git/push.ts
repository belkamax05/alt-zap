import execAsync from '@az/utils/exec/execAsync';
import getBranchDescription from '@az/utils/git/getBranchDescription';
import getLocalCommits from '@az/utils/git/getLocalCommits';
import { confirm, log } from '@clack/prompts';
import colors from 'colors';
import Command from '../../types/app/Command';

const push: Command = async () => {
  const { name: branchName } = await getBranchDescription();
  const commits = await getLocalCommits({ name: branchName });
  if (!commits) {
    log.info(`No commits to push at branch '${colors.yellow(branchName)}'`);
    return;
  }
  log.info('Commits to be pushed:');
  log.message(commits);
  const shouldPush = await confirm({
    message: 'Do you want to push these commits?',
    initialValue: false,
  });
  if (shouldPush) {
    const { stderr: output } = await execAsync('git push');
    log.info(output);
  }
};

export default push;
