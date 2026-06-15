// ETL exercise first version: loops

export const transform = (old) => {
  let new_format = {};
  for(let value in old) {
    for(let letter of old[value]){
      new_format[letter.toLowerCase()] =  parseInt(value);
    }
  }
  return new_format;
};
