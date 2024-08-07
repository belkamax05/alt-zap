import getBranchDescription from '@az/utils/git/getBranchDescription';
import Command from '../../types/app/Command';

const about: Command = async () => {
  try {
    const { name, isFlow, ...rest } = await getBranchDescription();
    console.log({ name, isFlow, ...rest });
  } catch (error) {
    console.error('Error fetching current branch:', error);
  }
};

export default about;
