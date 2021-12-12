file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def parse_input(str)
    first = str.split('-')[0]
    second = str.split('-')[1]

    if first == 'start' || first == 'end'
        first = first 
    elsif first.upcase == first 
        first = "#{first}_big"
    else
        first = "#{first}_small"
    end

    if second.upcase == second 
        second = "#{second}_big"
    elsif second == 'start' || second == 'end'
        second = second 
    else
        second = "#{second}_small"
    end

    [first, second]
end

def create_connections(lines)
    connections = {}
    lines.each do |line|
        parsed = parse_input(line)
        puts parsed.join(',')
        connections[parsed[0]] = parsed[1]
    end
    connections
end

connections = create_connections(lines)
puts connections