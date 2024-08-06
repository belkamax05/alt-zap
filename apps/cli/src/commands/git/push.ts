import { confirm, log } from '@clack/prompts';
import colors from 'colors';
import Command from '../../types/app/Command';
import execAsync from '../../utils/exec/execAsync';
import getBranchDescription from '../../utils/git/getBranchDescription';

const push: Command = async () => {
  const branchNameCmd = 'git rev-parse --abbrev-ref HEAD';
  const { stdout: _branchName } = await execAsync(branchNameCmd);
  const branchName = _branchName.replace('\n', '').trim();
  // const commitsCmd = `git log --branches --not --remotes --oneline`;
  const commitsCmd = `git log ${branchName} --not --remotes --oneline`;
  const { stdout: commits } = await execAsync(commitsCmd);
  console.log({ branchNameCmd, branchName, commitsCmd, commits });
  if (!commits) {
    const { name } = await getBranchDescription();
    log.info(`No commits to push at branch '${colors.yellow(name)}'`);
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

// git log --branches=master --not --remotes --oneline - works on all branches
