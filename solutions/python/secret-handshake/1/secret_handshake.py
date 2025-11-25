def commands(binary_str):
    actions = ["wink", "double blink", "close your eyes", "jump"]
    number_actions = 4
    output = []
    for idx in range(len(binary_str)-1,0,-1):
        if binary_str[idx] == "1":
            output.append(actions[number_actions-idx])
    if binary_str[0]=="1":
            output.reverse()
    return output
            
