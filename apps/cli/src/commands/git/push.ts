import { confirm, log } from '@clack/prompts';
import colors from 'colors';
import Command from '../../types/app/Command';
import execAsync from '../../utils/exec/execAsync';
import getBranchDescription from '../../utils/git/getBranchDescription';

const push: Command = async () => {
  const { name } = await getBranchDescription();
  const commitsCmd = `git log ${name} --not --remotes --oneline`;
  const { stdout: commits } = await execAsync(commitsCmd);
  if (!commits) {
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
