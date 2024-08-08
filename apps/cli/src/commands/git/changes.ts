import getFilesDiff from '@az/utils/git/getFilesDiff';
import formatCommand from '@az/utils/helpers/format/formatCommand';
import formatNumber from '@az/utils/helpers/format/formatNumber';
import { log } from '@clack/prompts';
import Command from '../../types/app/Command';

const changes: Command = async ({ command }) => {
  const { args } = command;
  const cached = ['--staged', '--cached']
    .map((arg) => args.includes(arg))
    .some(Boolean);
  const removed = ['--removed', '--deleted']
    .map((arg) => args.includes(arg))
    .some(Boolean);
  const which =
    `${cached ? 'staged' : 'unstaged'} ${removed ? 'removed' : ''}`.trim();

  const files = await getFilesDiff({ cached, removed });

  if (files.length === 0) {
    log.info(`No ${which} files found`);
    return;
  }
  log.info(
    `Total ${formatNumber(files.length)} ${formatCommand(which)} files:`,
  );
  log.message(files.map((file) => `- ${file}`).join('\n'));
};

export default changes;
