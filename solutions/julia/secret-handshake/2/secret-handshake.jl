function secret_handshake(code)
    actions = ["wink", "double blink", "close your eyes", "jump"]
    bits = reverse(bitstring(UInt16(code)))
    output = filter(x->x!=false,[bits[i]=='1' && actions[i] for i in 1:4])
    bits[5] == '1' && return reverse(output)
    output                                
end
