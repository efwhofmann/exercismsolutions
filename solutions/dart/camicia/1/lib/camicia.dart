class Camicia {

 int valOfCard(String card){
    switch(card){
      case 'J' : return 1;
      case 'Q' : return 2;
      case 'K' : return 3;
      case 'A' : return 4;
      default : return 0;
    }
  }

  // decks with non-paying cards replaced by '0' 
  List<String> deckOnlyPay(List<String> deck){
    return deck.map((c)=>valOfCard(c)>0 ? c : '0').toList();
  }
    
  Map<String, dynamic> simulateGame(List<String> playerA, List<String> playerB){
        List<String> pile = <String>[];    
        Set<String> seen = <String>{};
        int tricks = 0; 
        int cardsPlayed = 0;
        int debt=0;
        String status = "";    
        List<List<String>> players = [playerA, playerB];
        while(true){     
          var player = players[0];
          var other = players[1];

          if(player.isEmpty){
            tricks += (pile.isEmpty ? 0 : 1);
            status = "finished";
            break;
          }

        // check for looping 
          if(pile.isEmpty){ 
            var state = '${deckOnlyPay(playerA)}|${deckOnlyPay(playerB)}|$debt';
            if (seen.contains(state)){
              status = "loop";
              break;
            } else seen.add(state);
          }         

          // play a card
          final current = player.removeAt(0);
          pile.add(current);
          cardsPlayed += 1;

          if(valOfCard(current)>0){
            // penality card, (re)set debt
            debt = valOfCard(current);
          }
          else {
            if(debt>0){ //there's a debt, pay
              debt -= 1;
              if(debt==0){
                other.addAll(pile);
                pile.clear();
                tricks += 1;
                if(player.isEmpty || other.isEmpty){
                  status = "finished";
                  break;
                } 
              }       
              else continue; // still paying, keep on playing
            }            
          }
          players = [other, player]; //next turn
        }
      return {"status" : status,
              "cards" : cardsPlayed,
              "tricks" : tricks};
          
  }
}
