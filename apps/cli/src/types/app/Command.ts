import CommandOptions from './CommandOptions';

type Command = (options: CommandOptions) => void | Promise<void>;

export default Command;
