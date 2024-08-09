/**
 * @example
 * getGitStatusPorcelain()
 *  .then((files) => {
 *   console.log('Files:', files);
 *  })
 *  .catch((error) => {
 *   console.error('Error:', error);
 *  });
 */
const getAllUnstagedFiles = (): Promise<string[]> => {
  const { exec } = require('child_process');

  return new Promise((resolve, reject) => {
    exec(
      'git ls-files --others --exclude-standard',
      (error: any, stdoutUntracked: any) => {
        if (error) {
          reject(error);
          return;
        }

        exec('git diff --name-only', (error: any, stdoutModified: any) => {
          if (error) {
            reject(error);
            return;
          }

          exec(
            'git diff --name-only --cached',
            (error: any, stdoutStaged: any) => {
              if (error) {
                reject(error);
                return;
              }

              const files = [
                ...stdoutUntracked
                  .split('\n')
                  .filter((line: string) => line && !line.endsWith('/')),
                ...stdoutModified
                  .split('\n')
                  .filter((line: string) => line && !line.endsWith('/')),
                ...stdoutStaged
                  .split('\n')
                  .filter((line: string) => line && !line.endsWith('/')),
              ];

              resolve(files);
            },
          );
        });
      },
    );
  });
};

export default getAllUnstagedFiles;
