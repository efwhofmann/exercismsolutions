
@enum Mode begin
    ENCODE = 0
    DECODE = 1    
end

function encode(msg, rails)
    coder(msg,rails, ENCODE)
end

function decode(msg, rails)
    coder(msg,rails, DECODE)
end

function coder(msg, rails, mode::Mode)
    max_step = 2*(rails-1)
    output = ['_' for i in 1:length(msg)]
    cipher_pos = 1
    for the_rail in 1:rails
        step = max_step - 2*(the_rail-1)
        if step==0
            step = max_step
        end
        text_pos = the_rail
        while text_pos <= length(msg)
            if mode==ENCODE
                output[cipher_pos] = msg[text_pos]
            elseif mode==DECODE
                output[text_pos] = msg[cipher_pos]
            else
                throw(ErrorException("invalid mode"))
            end
            text_pos += step
            cipher_pos += 1
            step!=max_step && (step = max_step - step)
        end
    end
    String(output)
end
