import Command from '../../types/app/Command';
import logCommand from '../../utils/logCommand';
import wait from '../../utils/wait';

const delayed: Command = async ({ command }) => {
  const silent =
    command.args.includes('--silent') || command.args.includes('-s');

  if (!silent) console.log('delayed command running A');
  await wait(1000);
  logCommand('echo "Hello, World!"');
  logCommand('ls');
  await wait(400);
  process.stdout.write('3');
  await wait(400);
  process.stdout.write('2');
  await wait(400);
  process.stdout.write('1');
  await wait(400);
  process.stdout.write('...\n');
  logCommand('echo "Goodbye, World!"');
  logCommand('ls');
};

export default delayed;
