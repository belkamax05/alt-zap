import execAsync from '../exec/execAsync';

const getStagedFiles = async () => {
  const { stdout } = await execAsync('git diff --name-only --cached');
  return stdout.trim().split('\n').filter(Boolean);
};

export default getStagedFiles;
