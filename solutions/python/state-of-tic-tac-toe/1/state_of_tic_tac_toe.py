def count_cells_for(board, player):
    return len([c for c in "".join(board) if c==player])

def count_wins_for(board, player):
    win_string = player*3
    count = 0
    count += len([row for row in board if row==win_string])
    count += len([i for i in {0,1,2} if 
                  player==board[0][i]==board[1][i]==board[2][i]])
    if board[0][0] == board[1][1] == board[2][2]==player:
        count +=1
    if board[2][0] == board[1][1] == board[0][2]==player:
        count += 1
    return count

def gamestate(board):
    cross = 'X'
    naught = 'O'

    cc = count_cells_for(board, cross)
    cn = count_cells_for(board, naught)

    if cn>cc:
        raise ValueError("Wrong turn order: O started")
    elif cc-cn>1:
        raise ValueError("Wrong turn order: X went twice")
    state = ""
    wc = count_wins_for(board, cross)
    wn = count_wins_for(board, naught)

    if 0==wc and 0==wn:
        if cc+cn==9:
            state = "draw"
        else:
            state = "ongoing"
    elif (wc>0 and wn>0) or (wc>2 or wn>2):
        raise ValueError("Impossible board: game should have ended after the game was won")
    else:
        state = "win"
    return state