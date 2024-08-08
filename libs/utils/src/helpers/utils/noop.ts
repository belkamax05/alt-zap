/**
 * Function does not return any value (undefined). Used to debug function callbacks.
 */

import { AnyFunction } from '@az/types';

// eslint-disable-next-line @typescript-eslint/no-empty-function, @typescript-eslint/no-explicit-any
const noop: AnyFunction = () => {};

export default noop;
