file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

class Range
    def initialize(lower, upper)
        @lower = lower
        @upper = upper
    end

    def contains?(num)
        num >= @lower && num <= @upper
    end

    def to_s
        "L: #{@lower} U:#{@upper}"
    end
end

def parse_ranges(input_lines)
    ranges = []
    input_lines.each do |line|
        nums = line.split(': ')[1].split(' or ')
        nums.each do |r|
            bounds = r.split('-')
            ranges << Range.new(bounds[0].to_i, bounds[1].to_i)
        end
    end
    ranges
end

def parse_ticket(input_line)
    input_line.split(',').map(&:to_i)
end

def parse_nearby_tickets(input_lines)
    tickets = []
    input_lines.each {|ticket| tickets << parse_ticket(ticket)}
    tickets
end

personal_ticket_index = input_lines.find_index('your ticket:') + 1
nearby_ticket_index = input_lines.find_index('nearby tickets:') + 1

ranges = parse_ranges(input_lines[0..personal_ticket_index - 3])
ticket = parse_ticket(input_lines[personal_ticket_index])
nearby_tickets = parse_nearby_tickets(input_lines[nearby_ticket_index..-1])

error_tickets = []
nearby_tickets.each do |ticket|
    ticket.each do |num|
        error = true
        ranges.each do |range|
            error = false if range.contains?(num)
        end
        error_tickets << num if error 
    end
end

puts error_tickets.reduce(:+)