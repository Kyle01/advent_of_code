file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

def password(line)
    line.split(": ")[1]
end

def target_letter(line)
    line.split(' ')[1][0]
end

def first_index(line)
    line.chomp("-").to_i
end

def second_index(line)
    line.split("-")[1].split(" ")[0].to_i
end

def line_valid(line)
    number_of_characters_correct = 0
    pwd = password(line)
    target_letter = target_letter(line)
    first_position = first_index(line) - 1
    second_position = second_index(line) - 1

    if pwd[first_position] == target_letter
        number_of_characters_correct += 1 
    end
    if pwd[second_position] == target_letter
        number_of_characters_correct += 1 
    end
    
    number_of_characters_correct == 1
end

number_of_valid_passwords = 0 

input_lines.each do |line|
    if line_valid(line)
        number_of_valid_passwords += 1
    end
end


puts number_of_valid_passwords
