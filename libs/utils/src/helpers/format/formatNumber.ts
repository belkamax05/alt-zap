import colors from 'colors';

const formatNumber = (number: number | string) => colors.cyan(String(number));

export default formatNumber;
