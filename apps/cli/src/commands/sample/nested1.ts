import Command from '../../types/app/Command';

const sampleNested1: Command = ({ command }) => {
  console.log('Hello 1!', command);
};

export default sampleNested1;
