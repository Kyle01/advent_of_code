file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

def password(line)
    line.split(": ")[1]
end

def target_letter(line)
    line.split(' ')[1][0]
end

def lower_bound(line)
    line.chomp("-").to_i
end

def upper_bound(line)
    line.split("-")[1].split(" ")[0].to_i
end

def line_valid(line)
    pwd = password(line)
    target_letter = target_letter(line)
    lower_bound = lower_bound(line)
    upper_bound = upper_bound(line)

    pwd.count(target_letter) >= lower_bound && pwd.count(target_letter) <= upper_bound
end

number_of_valid_passwords = 0 

input_lines.each do |line|
    if line_valid(line)
        number_of_valid_passwords += 1
    end
end


puts number_of_valid_passwords

