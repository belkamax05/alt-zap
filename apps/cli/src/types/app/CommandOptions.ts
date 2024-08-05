import CommandInstance from './CommandInstance';
import ContextInstance from './ContextInstance';
import ProgramInstance from './ProgramInstance';

interface CommandOptions {
  program: ProgramInstance;
  context: ContextInstance;
  command: CommandInstance;
}

export default CommandOptions;
