import getFilesDiff, { GetFilesDiffProps } from '@az/utils/git/getFilesDiff';
import formatCommand from '@az/utils/helpers/format/formatCommand';
import formatNumber from '@az/utils/helpers/format/formatNumber';
import { log } from '@clack/prompts';
import Command from '../../types/app/Command';

const printFor = async ({ cached, removed }: GetFilesDiffProps) => {
  const which = `${cached === true ? 'staged' : cached === false ? 'unstaged' : ''}${
    removed ? ' removed' : ''
  }`;
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

const changes: Command = async ({ command }) => {
  const { args } = command;

  const cached = (() => {
    if (['--staged', '--cached'].map((arg) => args.includes(arg)).some(Boolean))
      return true;
    if (
      ['--unstaged', '--uncached', '--not-staged', '--not-cached']
        .map((arg) => args.includes(arg))
        .some(Boolean)
    )
      return false;
    return null;
  })();

  const removed = (() => {
    if (
      ['--removed', '--deleted'].map((arg) => args.includes(arg)).some(Boolean)
    )
      return true;
    if (
      ['--unremoved', '--undeleted', '--not-removed', '--not-deleted']
        .map((arg) => args.includes(arg))
        .some(Boolean)
    )
      return false;
    return null;
  })();

  if (cached === null) {
    await printFor({ cached: true, removed });
    await printFor({ cached: false, removed });
    return;
  }
  await printFor({ cached, removed });
};

export default changes;
