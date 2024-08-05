import programManager from './app/programManager';

const main = async () => {
  try {
    await programManager.run();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

main();
