const quantityOfCharacter = (searchStr: string, char: string) => {
  const res = searchStr.split(char).length - 1;
  return res;
};

export default quantityOfCharacter;
