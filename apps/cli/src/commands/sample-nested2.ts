import Command from '../types/app/Command';

const sampleNested2: Command = ({ command }) => {
  console.log('Hello 2!', command);
};

export default sampleNested2;
