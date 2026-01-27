export const format = (name, number) => {
  let lastdigit = number % 10;
  let lastwo = number % 100;
  let no_str = number.toString();
  if (lastwo==11 || lastwo==12 || lastwo==13){
    no_str = no_str + "th";
  }
  else {
    switch(lastdigit) {
      case 1: no_str += "st";
        break;
      case 2: no_str += "nd";
        break;
      case 3: no_str += "rd";
        break;
      default:
        no_str += "th";
    }
  }
  return name + ", you are the " + no_str + " customer we serve today. Thank you!"
};
