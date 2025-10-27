#

puts "O | O | O"
puts "X | X | X"
puts "_ | _ | _"

# Ill store current results in hash
# Need some logic to stop game when winning condition is met
# 
# Possible Hash and winning conditions
# game_hash = {
#   a: [0, 0, 0]
#   b: [0, 0, 0]
#   c: [0, 0, 0]
# }
# Same value in all indices of a, b or c array
# Same value at first, second or third indices of every array
# Same value at a[0], b[1], c[2]
# Same value at a[2], b[1], c[0]
# 
# Possible state view:
# puts "O | O | O"
# puts "X | X | X"
# puts "_ | _ | _"
# 
# 'Game' is a core class. Instance of game should handle all game mechanics
# 'Player' is gamer class. There should be two gamers per game registered.
# 1. Take player1 name and player 2 name
#   1.1 Player class: need `get_name` method (user_input)
# 2. Tell player1 is cross player
# 3. Start game N. Print "p1_name (X) vs p2_name (O). Round 'N'"
# 4. Print state. Get turn from 0 to 9 - p1, then p2
#   4.1 Player class: need 'get_turn_decision' method (user_input)
#   4.2 Game class: need 'get_x_position' and 'get_o_postion' method (class request) or 'get_p_position' for both (may be)
# 5. Make changes to turn result - check for winner/draw - if not: repit
# 6. When winner: print result, ask for new game, swich sides. Go to step 3 with N+1.
# 7. Game class: need Abort and End game behaviour.


