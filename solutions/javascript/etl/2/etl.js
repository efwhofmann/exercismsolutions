// ETL exercise second version: forEach

export const transform = (old) => {
  let new_format = {};
  for(let value in old) {
    old[value].forEach(letter =>
      {new_format[letter.toLowerCase()] =  parseInt(value);
    })
  }
  return new_format;
};
