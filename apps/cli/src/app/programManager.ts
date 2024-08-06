import ProgramInstance from '../types/app/ProgramInstance';

const programManager = new ProgramInstance(process.argv.slice(2));

export default programManager;
