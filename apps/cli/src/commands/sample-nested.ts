import Command from '../types/app/Command';

const sampleNested1: Command = ({ context }) => {
  context.addCommand('sample-nested1');
  context.addCommand('sample-nested2', ['again']);
};

export default sampleNested1;
