import Command from '../types/app/Command';
import logCommand from '../utils/logCommand';
import wait from '../utils/wait';

const config: Command = async () => {
  console.log('Config command running A');
  await wait(1000);
  console.log('Config command running B');
  await wait(1000);
  console.log('Config command running C');
  await wait(1000);
  console.log('Config command running D');
  logCommand('ls');
};

export default config;
