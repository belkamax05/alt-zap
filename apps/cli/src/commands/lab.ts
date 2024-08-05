import Command from '../types/app/Command';
import logCommand from '../utils/logCommand';
import wait from '../utils/wait';

const lab: Command = async () => {
  console.log('Lab command running A');
  await wait(1000);
  console.log('Lab command running B');
  await wait(1000);
  console.log('Lab command running C');
  await wait(1000);
  console.log('Lab command running D');
  logCommand('cd .. && cd .. && az here');
};

export default lab;
