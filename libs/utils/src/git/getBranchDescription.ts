import execAsync from '../exec/execAsync';
import getFlowParams from './getFlowParams';
import isBranchNameFlow from './isBranchNameFlow';

const getBranchDescription = async () => {
  const { stdout } = await execAsync('git branch --show-current');
  const name = stdout.trim();
  const isFlow = isBranchNameFlow(name);
  const flow = isFlow ? getFlowParams(name) : null;
  const ticketNumber = flow?.flowTicket?.toUpperCase();
  return {
    name,
    isFlow,
    flow,
    ticketNumber,
  };
};

export default getBranchDescription;
