function secret_handshake(code)
    actions = ["wink", "double blink", "close your eyes", "jump"]
    output = []
    idx = 1
    bits = reverse(bitstring(UInt16(code)))
    for i in 1:4
        bits[i]=='1' && push!(output, actions[i])
    end
    bits[5] == '1' && return reverse(output)
    output                                
end
