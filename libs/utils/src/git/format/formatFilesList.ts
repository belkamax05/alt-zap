const formatFilesList = (files: string[]) =>
  files.map((file) => `- ${file}`).join('\n');

export default formatFilesList;
