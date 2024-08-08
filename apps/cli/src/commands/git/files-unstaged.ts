import getFilesDiff from '@az/utils/git/getFilesDiff';
import { log } from '@clack/prompts';
import Command from '../../types/app/Command';

const filesUnstaged: Command = async () => {
  const files = await getFilesDiff({});

  if (files.length === 0) {
    log.info('No unstaged files found');
    return;
  }
  log.info('Unstaged files:');
  log.message(files.map((file) => `- ${file}`).join('\n'));
};

export default filesUnstaged;
