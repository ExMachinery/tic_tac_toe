#

puts "O | O | O"
puts "X | X | X"
puts "_ | _ | _"

# Ill store current results in array: 0 = O, -1 = "_", 1 = "X"
# Index is a position. 0 is a upper left, 9 is bottom right.
# 'Engine' is a core class. Instance of game should handle all game mechanics
# 'Game' is a one separate game. 
# 'Player' is gamer class. There should be two gamers per game registered.
# 1. Take player1 name and player 2 name
# 2. Tell player1 is cross player
# 3. Start game 1. Name of the game should be "p1_name (X) vs p2_name (O). Round 'N'"
# 4. Print state. Get turn from 0 to 9
# 5. Get turn - check - repit
# 6. When winner: Send result, ask for new game, swich sides.



# Hash
# game_hash = {
#   r1: => [0, 0, 0]
#   r2: => [0, 0, 0]
#   r3: => [0, 0, 0]
# }
# All in r1, r2, r3
# All first, All second, All third
# r1[0], r2[1], r3[2]
# r1[2], r2[1], r3[0]