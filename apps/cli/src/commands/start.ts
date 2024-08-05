// const start = () => {
//   spawn('concurrently', ['yarn mock', 'yarn start'], {
//     stdio: 'inherit',
//     shell: true,
//   });
// };

import logCommand from '../utils/logCommand';

const start = async () => {
  logCommand('yarn mock & yarn start');
  //   try {
  //     const { result, commands } = concurrently(
  //       [
  //         { command: 'yarn mock', name: 'mock', raw: true },
  //         { command: 'yarn start', name: 'start', raw: true },
  //       ],
  //       {
  //         prefix: 'name',
  //         killOthers: ['failure', 'success'],
  //         restartTries: 0,
  //       },
  //     );
  //     await result;
  //   } catch (error) {
  //     console.error('One of the commands failed:', error);
  //   }
};

// const success = () => {
//   console.log('All commands completed successfully.');
// };

// const failure = (error: any) => {
//   console.error('One of the commands failed:', error);
// };

export default start;
