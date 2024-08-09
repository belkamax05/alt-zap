import { multiselect } from '@clack/prompts';

const run = async () => {
  const additionalTools = await multiselect({
    message: 'Select additional tools.',
    options: [
      { value: 'eslint', label: 'ESLint', hint: 'recommended' },
      { value: 'prettier', label: 'Prettier' },
      { value: 'gh-action', label: 'GitHub Action' },
    ],
    required: false,
  });
  console.log('Hi there2', { additionalTools });

  // throw new Error('This is an error');
  process.exit(123);
};

run();
