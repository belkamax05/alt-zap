const runCommand = async (command: string, args: string[]) => {
  const { default: run } = await import(`../../commands/${command}.ts`);
  await run(args);
};

export default runCommand;
