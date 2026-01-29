pay_cards = {'J':1, 'Q':2, 'K':3, 'A':4}

def to_values(hand):
    value = lambda x: pay_cards[x] if x in pay_cards.keys() else 0
    return map(value, hand)    
        
def simulate_game(player_a, player_b):    
    player = [player_a, player_b]
    pile = []
    cards_played = 0
    tricks = 0
    turn = 0
    debt = 0
    seen = set()
    status = ""
    
    while True:
        handA = list(to_values(player[0]))
        handB = list(to_values(player[1]))
        
        if not pile:
            state = (tuple(handA), tuple(handB), turn)
            if state in seen:
                status = "loop"
                break
            else:
                seen.add(state)        
        
        if not player[turn]: 
            if pile!=[]:
                tricks +=1                
            status = "finished"
            break            
         
        current = player[turn].pop(0)        
        pile.append(current)  
        cards_played += 1

        if current in pay_cards.keys():
                debt = pay_cards[current]      
        else:        
             if debt > 0:
                debt -= 1
                if not debt:
                    player[1-turn].extend(pile)
                    pile = []
                    tricks += 1
                    debt = 0  
                    
                    if not player[0] or not player[1]:
                        status = "finished"
                        break
                        
                # if still paying, keep playing 
                else:
                    continue 
        turn = 1 - turn
        
    return {
        "status": status,
        "cards": cards_played,
        "tricks": tricks
    }