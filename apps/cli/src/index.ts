import programManager from './app/programManager';

const main = async () => {
  await programManager.run();
  // const [command, ...args] = argv;
  // if (command) {
  //   const commandResult = await runCommand(command, args);
  // }
  // console.log({ command, args, argv });
};

main();
