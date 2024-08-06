import satisfiesLegacy from '../utils/satisfiesLegacy';

const alias = satisfiesLegacy(
  {
    //? az
    install: 'az/install',
    //? config
    initialise: 'config/initialise',
    init: 'config/initialise',
    get: 'config/get',
    ['config-get']: 'config/get',
    set: 'config/set',
    ['config-set']: 'config/set',
    //? fe
    npkill: 'fe/npkill',
    //? git
    push: 'git/push',
    pull: 'git/pull',
    commit: 'git/commit',
    //? sample
    ['colors-true']: 'sample/colors-true',
    delayed: 'sample/delayed',
    dialogs: 'sample/dialogs',
    lorem: 'sample/lorem',
    hello: 'sample/hello',
    nested: 'sample/nested',
    //? system
    envs: 'system/envs',
    poweroff: 'system/poweroff',
    //? terminal
    here: 'terminal/here',
    load: 'terminal/load',
    reload: 'terminal/reload',
    restart: 'terminal/restart',
    up: 'terminal/up',
  } as const,
  null as unknown as Record<string, string>,
);

export default alias;
