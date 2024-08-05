import Command from '../types/app/Command';

const printEnvs: Command = async () => {
  console.log('Running print-envs');
  console.log(process.env);
};

export default printEnvs;
