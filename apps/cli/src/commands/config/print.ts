import getUserConfig from '@az/utils/config/getUserConfig';
import Command from '../../types/app/Command';

const print: Command = async ({ program }) => {
  const userConfig = getUserConfig({ configPath: program.env.AZ_CONFIG_DIR });
  console.log(userConfig);
};

export default print;
