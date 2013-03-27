class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
  if (m1.match(/[R]/i) && m2.match(/[S]/i)) 
    return 1
  elsif (m2.match(/[R]/i) && m1.match(/[S]/i)) 
    return 2
  elsif (m1.match(/[S]/i) && m2.match(/[P]/i)) 
    return 1
  elsif (m2.match(/[S]/i) && m1.match(/[P]/i)) 
    return 2
  elsif (m1.match(/[P]/i) && m2.match(/[R]/i)) 
    return 1
  elsif (m2.match(/[P]/i) && m1.match(/[R]/i)) 
    return 2
  end
end

def rps_game_winner(game)
  # YOUR CODE HERE
  raise WrongNumberOfPlayersError unless game.length == 2

  player1 = game[0]
  player2 = game[1]

  raise NoSuchStrategyError unless ( player1[1].match(/[R,P,S]/i) && player2[1].match(/[R,P,S]/i))

  if(player1[1] == player2[1])  
    return player1
  end

  if(rps_result(player1[1],player2[1])== 1) 
    return player1 
  else 
    return player2
  end

end

def rps_tournament_winner(tournament)
  # YOUR CODE HERE
  new_tournament = Array.new
  new_round = Array.new
  tournament.each do |games| 
      new_game = Array.new
      new_game.push(rps_game_winner(games[0]))
      new_game.push(rps_game_winner(games[1]))
      new_round.push(new_game)
  end
    if (new_round.count==1)
      return rps_game_winner(new_round[0])
    end
    new_tournament.push(new_round)
    rps_tournament_winner(new_tournament)
end


rps_game_winner([ ["Armando", "S"], ["Dave", "P"]])
rps_game_winner([ ["Armando", "S"], ["Dave", "R"]])
rps_game_winner([ ["Armando", "P"], ["Dave", "R"]])
rps_game_winner([ ["Armando", "P"], ["Dave", "S"]])
rps_game_winner([ ["Armando", "R"], ["Dave", "P"]])
rps_game_winner([ ["Armando", "R"], ["Dave", "S"]])

rps_game_winner([ ["Armando", "r"], ["Dave", "s"]])

rps_game_winner([ ["Armando", "R"], ["Dave", "T"]])

rps_game_winner([ ["Armando", "R"], ["Dave", "S"], ["Jake", "S"]])
rps_game_winner([ ["Armando", "R"]])



rps_tournament_winner([
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
] )

rps_tournament_winner([[[["Dave", "S"], ["Richard", "R"]], [["Allen", "S"], ["Richard X.", "P"]]]])
