file = File.open('input.txt')
lines = file.readlines.map(&:chomp)
player_one_pos = lines[0].split(': ')[1].to_i
player_two_pos = lines[1].split(': ')[1].to_i

def determine_end_spot(start, distance)
    distance = distance % 10
    start += distance
    start -= 10 if start > 10
    start
end

player_one_score = 0
player_two_score = 0
current_rolls = [1, 2 ,3]
number_of_dice_rolls = 3

while  player_one_score < 1000 && player_two_score < 1000
    player_one_pos = determine_end_spot(player_one_pos, current_rolls.reduce(:+))
    player_one_score += player_one_pos
    puts "Dice rolls #{number_of_dice_rolls}, Player One: #{player_one_score}, Player Two: #{player_two_score}, Current Rolls: #{current_rolls.join(', ')}"
    break if player_one_score >= 1000
    current_rolls = current_rolls.map{ |roll| roll + 3 }
    number_of_dice_rolls += 3
    player_two_pos = determine_end_spot(player_two_pos, current_rolls.reduce(:+))
    player_two_score += player_two_pos
    puts "Dice rolls #{number_of_dice_rolls}, Player One: #{player_one_score}, Player Two: #{player_two_score}, Current Rolls: #{current_rolls.join(', ')}"
    break if player_two_score >= 1000
    current_rolls = current_rolls.map{ |roll| roll + 3 }
    number_of_dice_rolls += 3
end