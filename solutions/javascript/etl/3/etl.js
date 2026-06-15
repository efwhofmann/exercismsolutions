// ETL exercise third version: no more loops

export const transform = (old) => {
  let new_format = {};
  (Object.keys(old)).forEach(value =>     
      {old[value].forEach(letter =>
        {new_format[letter.toLowerCase()] =  parseInt(value);
        }) 
      })
  return new_format;
};
