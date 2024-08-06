import { confirm, log } from '@clack/prompts';
import colors from 'colors';
import Command from '../../types/app/Command';
import execAsync from '../../utils/exec/execAsync';
import getBranchDescription from '../../utils/git/getBranchDescription';

const push: Command = async () => {
  const { stdout: commits } = await execAsync(
    'git log --oneline --branches=$(git rev-parse --abbrev-ref HEAD) --not --remotes',
  );
  if (!commits) {
    const { name } = await getBranchDescription();
    log.info(`No commits to push at branch '${colors.yellow(name)}'`);
    return;
  }
  log.info('Commits to be pushed:');
  log.message(commits);
  const shouldPush = await confirm({
    message: 'Do you want to push these commits?',
    initialValue: true,
  });
  if (shouldPush) {
    const { stdout: output } = await execAsync('git push');
    console.log({ output });
    log.message(output);
  }
};

export default push;
