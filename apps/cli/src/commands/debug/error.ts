import Command from '../../types/app/Command';

const debugError: Command = () => {
  console.log(
    'Error should be thrown and come back to cli execution with error',
  );
  throw new Error('Debug error');
};

export default debugError;
