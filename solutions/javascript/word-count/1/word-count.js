// word Count 

export const countWords = (phrase) => {
  let counts = {}
  phrase.toLowerCase()
        .split(new RegExp("\\s|[^a-z0-9']|'\\B|\\B'"))
        .forEach(word =>
          {if(word.length>0)
            counts[word] = isNaN(counts[word]) ? +1 : counts[word]+1;});
  return counts;
};
