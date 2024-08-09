console.log('Hello from hello.ts!');
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
  console.log({ additionalTools });
};

run();
