//
// Acronym

export const parse = (phrase) => {
  return phrase
          .split(/[\s-_]+/)
          .map((w) => w[0].toUpperCase())
          .join('')
};
