# define ONGOING, WIN, and LOSE

@enum State begin
    ONGOING = 0
    WIN = 1
    LOSE = 2
end

mutable struct cow
    remaining::Int
    word::String
    masked::Vector{Char}
    state::State
    
    function cow(word::String)
        new(10,word, collect(repeat('_',length(word))), ONGOING)
    end
   
 end

function new_game(word)
    cow(word)
end

function state(game)
    game.state
end

function masked_word(game)
    String(game.masked)
end

function remaining_failures(game)
    game.remaining >= 1 ? game.remaining -1 : 0
end

function guess!(game, letter)
    # error if game not ongoing
    game.state == ONGOING || throw(ErrorException("game is over!"))
    if !occursin(letter, game.word)
        game.remaining -= 1
    else
        for i in 1:length(game.word)
            if game.word[i] == letter 
                if game.masked[i] == letter
                    game.remaining -= 1
                else
                    game.masked[i] = letter
                end
            end
        end
    end
    if !occursin('_', String(game.masked))
        game.state = WIN
    elseif game.remaining <= 0 
        game.state = LOSE
    end
   # println(game.state, game.remaining, game.masked)
end
