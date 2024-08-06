import Command from '../../types/app/Command';
import getBranchDescription from '../../utils/git/getBranchDescription';

const about: Command = async () => {
  try {
    const { name, isFlowBranch, ...rest } = await getBranchDescription();
    console.log({ name, isFlowBranch, ...rest });
  } catch (error) {
    console.error('Error fetching current branch:', error);
  }
};

export default about;
