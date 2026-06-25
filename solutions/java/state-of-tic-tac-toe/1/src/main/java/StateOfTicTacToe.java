class StateOfTicTacToe {

    int cellsForPlayer(String[] board, char player){
        String pattern = player=='X' ? "[^X]" : "[^O]";
        int count = 0;
        for(String row : board){
            count += row.replaceAll(pattern,"").length();
        }
        return count;
    }

    int winsForPlayer(String[] board, String winStr){
        int count = 0;
        for(String row : board){
            if(row == winStr)
                count++;
        }
        char player=winStr.charAt(0);
        for(int i=0; i<3; i++){
            if(board[0].charAt(i) == player 
                && board[0].charAt(i) == board[1].charAt(i)
                && board[1].charAt(i) == board[2].charAt(i))
                    count++;
        }
        if(player == board[0].charAt(0) && 
          board[0].charAt(0) == board[1].charAt(1) && 
          board[1].charAt(1) == board[2].charAt(2))
            count++;
        if(player == board[0].charAt(2) && 
          board[0].charAt(2) == board[1].charAt(1) && 
          board[1].charAt(1) == board[2].charAt(0))
            count++;
        return count;
    }
    
    public GameState determineState(String[] board) {
        GameState state;
        int cX = cellsForPlayer(board, 'X');
        int cO = cellsForPlayer(board,'O');
        if (cO>cX)
            throw new IllegalArgumentException("Wrong turn order: O started");
        else if (cX-cO>1)
            throw new IllegalArgumentException("Wrong turn order: X went twice");
        int wX = winsForPlayer(board, "XXX");
        int wO = winsForPlayer(board, "OOO");
        if(0==wX && 0==wO){
            if(cX + cO == 9)
                state = GameState.DRAW;
            else
                state = GameState.ONGOING;                
        }
        else if ((wX>0 && wO>0) || (wX>2 || wO>2))
            throw new IllegalArgumentException("Impossible board: game should have ended after the game was won");
        else
            state = GameState.WIN;
        return state;        
    }
}
