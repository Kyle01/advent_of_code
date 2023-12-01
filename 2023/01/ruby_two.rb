lines = File.open('input.txt').readlines.map(&:chomp)

def indices_of_matches(str, target)
  sz = target.size
  (0..str.size-sz).select { |i| str[i,sz] == target }
end


def get_number line
    numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    words = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
    hash = Hash.new

    numbers.each do |num| 
        matched_indexes = indices_of_matches(line, num)
        if (matched_indexes.length > 0)
            matched_indexes.each{|x| hash[x] = num}
        end
    end
    
    words.each do |word| 
        matched_indexes = indices_of_matches(line, word)
        if (matched_indexes.length > 0)
            matched_indexes.each{|x| hash[x] = words.find_index(word)}
        end
    end

    keys = hash.keys.sort

    if keys.length < 2
        return "#{hash[keys[0]]}#{hash[keys[0]]}".to_i
    end

    "#{hash[keys[0]]}#{hash[keys[-1]]}".to_i
end

answer = 0
lines.each do |line|
    answer += get_number(line)
end

puts answer