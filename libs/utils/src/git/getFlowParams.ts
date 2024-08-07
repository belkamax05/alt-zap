import isBranchNameFlow from './isBranchNameFlow';

const getFlowParams = (branchName: string) => {
  const isFlowBranch = isBranchNameFlow(branchName);
  const [flowCategory, flowTicket, flowName] = isFlowBranch
    ? branchName.split('/')
    : [];

  return {
    flowCategory,
    flowTicket,
    flowName,
  };
};

export default getFlowParams;
