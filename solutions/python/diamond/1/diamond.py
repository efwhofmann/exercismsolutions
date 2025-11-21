def rows(letter):
    rows = []
    m = ord(letter[0])- ord('A')
    nr = 2*(m+1)-1
    for i in range(nr):
        current_row = ""
        idx = i
        if i>m:
            idx = - idx + 2*m
        current_char = chr(idx + ord('A'))
        for j in range(-m,m+1):
            if j == idx or j == -idx:
                current_row += current_char
            else:
                current_row += ' '
        rows.append(current_row)
    return rows
