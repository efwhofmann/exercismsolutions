function count_for(board, player)
    res = length(filter(c -> c==player, join(board, "")))
end

function wins_for(board, player)
    count = 0
    for r in 1:3
        count += board[r] == string(player^3) ? 1 : 0
    end
    for c in 1:3
        if board[1][c] == board[2][c] == board[3][c] == player
            count += 1
        end
    end
    count += board[1][1] == board[2][2] == board[3][3] == player ? 1 : 0
    count += board[1][3] == board[2][2] == board[3][1] == player ? 1 : 0
    count    
end

function gamestate(board)
        cross = 'X'
        naught = 'O'
        cc = count_for(board,cross)
        cn = count_for(board,naught)
        
        if cn>cc || cc-cn>1
            error("Invalid board: wong turn order")
        end
        wc = wins_for(board,cross)
        wn = wins_for(board,naught)
        if wc==0 && wn==0 
            if cc + cn == 9 
                "draw"
            else
                "ongoing"
            end
        elseif  wc>0 && wn>0 || wc>2 || wn>2
            error("Invalid board: game should have ended after the game was won")
        else
            "win"
        end
    end
