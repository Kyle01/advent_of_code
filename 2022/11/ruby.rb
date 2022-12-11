lines = File.open('input.txt').readlines.map(&:chomp)
paragraphs = []
lines.each_slice(7) {|p| paragraphs << p}
monkey_items = paragraphs.map {|p| p[1].split(': ')[1].split(', ').map(&:to_i) }
monkey_inspection_count = monkey_items.map{ |_| 0}
number_of_rounds = 20

def map_value (old_value, line)
    return old_value * old_value if line.include?('old * old')
    
    return old_value + 3 if line.include?('old + 3')

    return old_value + 6 if line.include?('old + 6')

    return old_value * 19 if line.include?('old * 19')

    return old_value * 7 if line.include?('old * 7')

    return old_value + 4 if line.include?('old + 4')

    return old_value + 2 if line.include?('old + 2')

    return old_value + 7 if line.include?('old + 7')

    return old_value * 17 if line.include?('old * 17')
    
    old_value + 8
    
end

def monkey_destination(paragraph, item)
    divisible = item % paragraph[3].split(" by ")[1].to_i == 0

    return paragraph[4].split(" monkey ")[1].to_i if divisible
    paragraph[5].split(" monkey ")[1].to_i
end

def print_monkeys monkey_items 
    str = ""

    monkey_items.each_with_index do |m, i|
        str += "#{i}: #{m.join(', ')}"
        str += "\n"
    end

    str
end

puts print_monkeys monkey_items

number_of_rounds.times do 
    paragraphs.each_with_index do |paragraph, monkey_number|
        monkey_items[monkey_number] = monkey_items[monkey_number].map{ |item| map_value(item, paragraph[2]) / 3} 
        monkey_inspection_count[monkey_number] += monkey_items[monkey_number].length
        until monkey_items[monkey_number].empty?
            item = monkey_items[monkey_number].shift
            destination_monkey = monkey_destination(paragraph, item)
            monkey_items[destination_monkey] << item
        end
    end
end

puts monkey_inspection_count.join(',')