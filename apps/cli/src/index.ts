const wait = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));

const main = async () => {
  console.log('Hi');
  await wait(1000);
  console.log(process.argv);
  await wait(1000);
  console.log('Bye');
};

main();
