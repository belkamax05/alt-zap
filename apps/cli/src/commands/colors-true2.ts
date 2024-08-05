const colorsTrue2 = async () => {
  console.log('256 Colors Example:');
  for (let i = 0; i <= 255; i++) {
    process.stdout.write(`\x1b[38;5;${i}m${i} `);
    if ((i + 1) % 16 === 0) {
      console.log('\x1b[0m');
    }
  }
  console.log('\x1b[0m'); // Reset colors

  // True color example
  console.log('True Color Example:');
  for (let r = 0; r <= 255; r += 51) {
    for (let g = 0; g <= 255; g += 51) {
      for (let b = 0; b <= 255; b += 51) {
        process.stdout.write(`\x1b[48;2;${r};${g};${b}m  `);
      }
      console.log('\x1b[0m');
    }
  }
};

export default colorsTrue2;
