file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

hash = {}
input_lines.each do |line|
    temp = line.split("bag")
    key_bag = temp[0].rstrip.to_s
    value_bags = []
    k = 1 
    while k < temp.length
        temp2 = temp[k].slice(/([0-9])(.*)/)
        unless temp2.nil?
            temp2 = temp2.split(" ", 2)[1].rstrip
            value_bags << temp2
        end
        k += 1
    end
    hash[key_bag] = value_bags
end

def has_gold(key, hash)
    return false if hash[key.to_s].nil?
    hash[key].each do |bag|
        if bag == 'shiny gold'
            return true
        elsif !hash.key?(bag.to_s)
            return false
        else
            return has_gold(bag.to_s, hash)
        end
    end
    return false
end

gold_possible_count = 0 

hash.each do |key, value|
    puts "#{key}: #{value}"
    value = has_gold(key, hash)
    puts value 
    gold_possible_count += 1 if value 
end

puts gold_possible_count

# for item in the hash, go through the value array,
# for each one, look it up in the hash. if it doesnt exist, retrun false, if it returns a gold reutnr true, 
# incremeent a counter if true 

