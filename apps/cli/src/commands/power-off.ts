// function az-shutdown() {
//     # Turn off computer at any OS (MacOS, Linux, WSL)
//     if [[ "$OSTYPE" == "darwin"* ]]; then
//         # sudo shutdown -h now
//         osascript -e 'tell application "System Events" to shut down'
//     elif [[ "$OSTYPE" == "linux-gnu" ]]; then
//         # sudo shutdown -h now
//         for session in $(loginctl list-sessions | awk 'NR>1 {print $1}'); do
//             loginctl terminate-session "$session"
//         done
//         sudo shutdown -h now
//     elif [[ "$OSTYPE" == "linux-android" ]]; then
//         sudo shutdown -h now
//     else
//         echo "OS not supported"
//     fi
// }

import { execSync } from 'child_process';
import Command from '../types/app/Command';

const shutdown: Command = () => {
  // Turn off computer at any OS (MacOS, Linux, WSL)
  console.log('process.platform', process.platform);

  console.log('TODO');

  if (process.platform === 'darwin') {
    // sudo shutdown -h now
    execSync('osascript -e \'tell application "System Events" to shut down\'');
  } else if (process.platform === 'linux') {
    // sudo shutdown -h now
    // execSync(
    //   'for session in $(loginctl list-sessions | awk \'NR>1 {print $1}\'); do loginctl terminate-session "$session"; done; sudo shutdown -h now',
    // );
  } else if (process.platform === 'android') {
    // execSync('sudo shutdown -h now');
  } else {
    console.log('OS not supported');
  }
};

export default shutdown;
