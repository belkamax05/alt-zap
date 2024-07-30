const wait = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));

const hiBye = async () => {
  console.log('Hi');
  await wait(1000);
  console.log(process.argv);
  await wait(1000);
  console.log('Bye');
};

const printEcho = () => {
  console.log('cd ..');
};

const main = async () => {
  printEcho();
};

main();
