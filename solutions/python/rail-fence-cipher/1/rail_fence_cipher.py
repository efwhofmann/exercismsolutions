def encode(message, rails):
    return coder(message, rails, "encode")


def decode(encoded_message, rails):
    return coder(encoded_message, rails, "decode")

def coder(text, rails, mode):
    max_step = 2*(rails-1)
    output=["\0" for i in range(0, len(text))]
    position = 0
    for the_rail in range(0,rails):
        step = 2*the_rail
        if 0==the_rail:
            step = max_step
        text_pos = the_rail
        while text_pos< len(text):
            if mode=="encode":
                output[position] = text[text_pos] 
            elif mode=="decode":
                output[text_pos] = text[position]
            else: 
                raise ValueError("Invalid mode.")
            if step!=max_step:
                step = max_step - step
            text_pos += step
            position +=1
    return ''.join(output)  