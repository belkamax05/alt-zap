import { multiselect } from '@clack/prompts';
import logCommand from '../utils/logCommand';
import Command from '../types/app/Command';

const demoDialogs: Command = async () => {
  // console.log('Running demo-dialogs with args: ', args);

  const commandToExecute = (await multiselect({
    message: 'Select additional tools.',
    options: [
      { value: 'ls', label: 'Print ls', hint: 'Print ls' },
      { value: 'cd ..', label: 'Run "cd .."', hint: 'Go up one folder' },
      { value: 'echo "Hello"', label: 'Echo "Hello"' },
    ],
    required: false,
  })) as string[];

  commandToExecute.forEach((command) => {
    console.log({ command });
    logCommand(command);
  });

  //   const additionalTools = await multiselect({
  //     message: 'Select additional tools.',
  //     options: [
  //       { value: 'eslint', label: 'ESLint', hint: 'recommended' },
  //       { value: 'prettier', label: 'Prettier' },
  //       { value: 'gh-action', label: 'GitHub Action' },
  //     ],
  //     required: false,
  //   });
  //   console.log('Hi there2', { additionalTools });
};

export default demoDialogs;
