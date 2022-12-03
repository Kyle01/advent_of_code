def find_badge lines
    answer_char = nil

    lines[0].split('').each do |char|
        if lines[1] && lines[1].include?(char) && lines[2] && lines[2].include?(char)
            answer_char = char
        end
    end

    answer_char
end

def compute_letters line 
    first,second = line.partition(/.{#{line.size/2}}/)[1,2]    
    answer_char = nil

    first.split('').each do |char|
        if second.include?(char) 
            answer_char = char
        end
    end

    answer_char
end

def letter_values letters 
    lower_arr = ("a".."z").to_a
    upper_arr = ("A".."Z").to_a
    key = ['.'].concat(lower_arr).concat(upper_arr)
    values = []

    letters.each {|letter| values << key.find_index(letter) }
    
    values
end

lines = File.open('input.txt').readlines.map(&:chomp)
badges = []
lines.each_slice(3) {|lines| badges << find_badge(lines)}
puts letter_values(badges).inject(:+)