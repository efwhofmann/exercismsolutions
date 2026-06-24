const responses = [
        "Sure.",
        "Whoa, chill out!",
        "Calm down, I know what I'm doing!",
        "Fine. Be that way!",
        "Whatever."];

const isShouting = stimulus => 
         /[A-Z]/.test(stimulus) && !/[a-z]/.test(stimulus);
    
const isSilence = stimulus => stimulus.trim().length == 0;

const isQuestion = stimulus => /\?$/.test(stimulus.trim());
    

export const hey = (stimulus) => {
    let response = ""
    if (isSilence(stimulus))
      response = responses[3];
    else if (isQuestion(stimulus))
      response = isShouting(stimulus) ? responses[2] : responses[0];
    else if (isShouting(stimulus)) 
      response = responses[1];
    else
      response = responses[4]
    return response
};
