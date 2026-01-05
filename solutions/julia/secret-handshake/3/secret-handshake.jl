function secret_handshake(code)
    actions = ["wink", "double blink", "close your eyes", "jump"]
    bits = reverse(bitstring(UInt16(code)))
    output = [actions[i] for i in 1:4 if bits[i]=='1']
    bits[5] == '1' && return reverse(output)
    output                                
end
