import quantityOfCharacter from '../helpers/string/quanitityOfCharacter';

export interface IsBranchNameFlowProps {
  name: string;
}

const isBranchNameFlow = (name: string) => {
  const slashCount = quantityOfCharacter(name, '/');
  return slashCount > 1;
};

export default isBranchNameFlow;
