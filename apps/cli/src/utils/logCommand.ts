/**
 * Prints shell command to terminal, preffixed by "> " so "az" can pick it up
 * @param text shell command to be printed
 * @returns "> {text}"
 */
const logCommand = (text: string) => console.log(`> ${text}`);

export default logCommand;
