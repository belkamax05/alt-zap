import execAsync from '../exec/execAsync';

const getUnstagedFiles = async () => {
  const { stdout } = await execAsync('git diff --name-only');
  return stdout.trim().split('\n');
};

export default getUnstagedFiles;
