import execAsync from '../exec/execAsync';

export interface ExecCommitProps {
  message: string;
}

const execCommit = async ({ message }: ExecCommitProps) => {
  return await execAsync(`git commit -m '${message}'`);
};

export default execCommit;
