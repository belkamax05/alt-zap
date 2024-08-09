import fs from 'fs';
import Command from '../../types/app/Command';

const convertToZsh: Command = async ({ program }) => {
  const { debug, debugCommandHeader, ..._rest } = program.userConfig;
  const configBody = `
  AZ_DEBUG=${debug ? 1 : 0}
  AZ_DEBUG_COMMAND_HEADER=${debugCommandHeader ? 1 : 0}
  `;
  const normalizedConfigBody = configBody
    .trim()
    .split('\n')
    .map((item) => item.trim())
    .join('\n');
  fs.writeFileSync(
    program.env.AZ_CONFIG_DIR + '/user-config.zsh',
    normalizedConfigBody,
  );
};

export default convertToZsh;
