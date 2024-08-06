import Command from '../../types/app/Command';

const envs: Command = async () => {
  console.log('Running print-envs');
  console.log(process.env);
};

export default envs;
