import runCommand from './utils/runCommand';

const argv = process.argv.slice(2);

const main = async () => {
  const [command, ...args] = argv;
  if (command) {
    const commandResult = await runCommand(command, args);
  }
  // console.log({ command, args, argv });
};

main();
