import Command from '../types/app/Command';
import logCommand from '../utils/logCommand';
import wait from '../utils/wait';

const config: Command = async () => {
  console.log('Config command running A');
  await wait(1000);
  console.log('Config command running B');
  await wait(1000);
  logCommand('echo "Hello, World!"');
  logCommand('ls');
  await wait(1000);
  console.log('Config command running C');
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

export default config;
