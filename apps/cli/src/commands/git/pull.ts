import { spawn } from 'child_process';

const pull = () => {
  spawn('git', ['pull'], {
    stdio: 'inherit',
    shell: true,
  });
};

export default pull;
