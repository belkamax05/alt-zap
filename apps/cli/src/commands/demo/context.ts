import Command from '../../types/app/Command';
import CommandInstance from '../../types/app/CommandInstance';

const demoContext: Command = async ({ command, program, context }) => {
  console.log('!!! demo context command runs');
  context.addCommand(new CommandInstance(['hello']));
  await context.instantCommand(new CommandInstance(['hello']));
  context.addCommand(new CommandInstance(['hello']));
  console.log('!!! demo context command ends');
};

export default demoContext;
