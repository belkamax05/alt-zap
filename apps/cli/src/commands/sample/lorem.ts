import Command from '../../types/app/Command';
import logCommand from '../../utils/logCommand';

const lorem1 = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
const lorem2 =
  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua';
const lorem3 =
  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat';
const lorem4 =
  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur';

// const loremDefine = `export loremIpsum="${lorem1}. ${lorem2}. ${lorem3}. ${lorem4}."`;

const loremDefine = `export loremIpsum="${lorem1}"`;

const lorem: Command = ({ command }) => {
  const [_effect] = command.args;
  const effect = _effect || 'bouncyballs';
  logCommand(`${loremDefine}`);
  logCommand(`echo $loremIpsum | tte ${effect}`);
};

export default lorem;
