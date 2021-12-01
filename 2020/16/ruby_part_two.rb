require 'pry'

file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

class Range
    def initialize(first_lower, first_upper, second_lower, second_upper)
        @first_lower = first_lower
        @first_upper = first_upper
        @second_lower = second_lower
        @second_upper = second_upper
    end

    def contains?(num)
        if num >= @first_lower && num <= @first_upper
            return true 
        elsif num >= @second_lower && num <= @second_upper
            return true 
        else
            return false
        end
    end

    def to_s
        "#{@first_lower}-#{@first_upper} or #{@first_lower}-#{@second_upper}"
    end
end

def parse_ranges(input_lines)
    ranges = []
    input_lines.each do |line|
        nums = line.split(': ')[1].split(' or ')
        helper = []
        nums.each do |r|
            bounds = r.split('-')
            helper << bounds[0].to_i
            helper << bounds[1].to_i
        end
        range = Range.new(helper[0], helper[1], helper[2], helper[3])
        ranges << range
    end
    ranges
end

def field(index, lines)
    lines[index].split(':')[0] if index < lines.length
end

def parse_ticket(input_line)
    input_line.split(',').map(&:to_i)
end

def parse_nearby_tickets(input_lines)
    tickets = []
    input_lines.each {|ticket| tickets << parse_ticket(ticket)}
    tickets
end

def destroy_invalid_tickets(nearby_tickets, ranges)
    correct_tickets = []
    nearby_tickets.each do |ticket|
        has_error = false
        ticket.each do |num|
            error = true
            ranges.each do |range|
                error = false if range.contains?(num)
            end
            has_error = true if error 
        end
        correct_tickets << ticket unless has_error
    end
    correct_tickets
end

personal_ticket_index = input_lines.find_index('your ticket:') + 1
nearby_ticket_index = input_lines.find_index('nearby tickets:') + 1

range_lines = input_lines[0..personal_ticket_index - 3]
ranges = parse_ranges(range_lines)
ticket = parse_ticket(input_lines[personal_ticket_index])
nearby_tickets = parse_nearby_tickets(input_lines[nearby_ticket_index..-1])
valid_tickets = destroy_invalid_tickets(nearby_tickets, ranges)
valid_tickets << ticket
categories = []


num_index = 0
range_index = 0 
while num_index < ticket.size
    ticket_index = 0
    while ticket_index < valid_tickets.size
        puts "R: #{ranges[range_index]} Num: #{valid_tickets[ticket_index][num_index]}"
        binding.pry
        if !ranges[range_index].contains?(valid_tickets[ticket_index][num_index])
            range_index += 1 
            ticket_index = 0
        else
            ticket_index += 1 
        end
    end
    categories << range_index
    range_index = 0
    while categories.include?(range_index)
        range_index += 1
    end
    num_index += 1 
end

puts categories.join(',')
puts categories.length
puts ticket.length
puts ranges.length

# puts 107*109*127*167*139*67