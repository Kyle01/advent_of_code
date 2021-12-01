file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

rules = {}
messages = []

part_one = true 
input_lines.each do |line|
    if line.empty?
        part_one = false 
        next
    end

    if part_one
        key = line.split(": ")[0]
        value = line.split(": ")[1]
        rules[key] = value
    else 
        messages << line 
    end
end

rules.each do |key, value|
    if value.include?("|")
        rules[key] = [value.split(" | ")[0], value.split(" | ")[1]]
    else
        rules[key] = [value]
    end
end

# converted_rules = {}
# rules.each do |key, value|
#     possibilities = []

#     value.each do |nums|
#         nums.split(" ").each do |num|

#         end
#     end
#     converted_rules[key] = possibilities
# end


def convert_rule(rules, num)
    # puts rules
    # puts num
    # puts rules[num]
    puts rules
    value = rules[num]
    return "" if value.nil?
    return value if value.include?("a") || value.include?("b")
    str = ""
    value[0].split(" ").each do |n|
        puts n
        str += convert_rule(rules, rules[n])
    end
    return str
end


puts convert_rule(rules, "0")