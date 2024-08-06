import execAsync from '../exec/execAsync';
import quantityOfCharacter from '../helpers/quantityOfCharacter';

const getBranchDescription = async () => {
  const { stdout } = await execAsync('git branch --show-current');
  const name = stdout.trim();
  const slashCount = quantityOfCharacter(name, '/');
  const isFlowBranch = slashCount > 1;
  const [flowCategory, flowTicket, flowName] = isFlowBranch
    ? name.split('/')
    : [];

  const ticketNumber = flowTicket?.toUpperCase();

  return {
    name,
    isFlowBranch,
    flowCategory,
    flowTicket,
    flowName,
    ticketNumber,
  };
};

export default getBranchDescription;
