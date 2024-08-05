import satisfiesLegacy from '../utils/satisfiesLegacy';

const alias = satisfiesLegacy(
  {
    //? fe
    npkill: 'fe/npkill',
    //? git
    push: 'git/push',
    pull: 'git/pull',
    commit: 'git/commit',
    //? system
    poweroff: 'system/poweroff',
  } as const,
  null as unknown as Record<string, string>,
);

export default alias;
