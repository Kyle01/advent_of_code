file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

def count_questions(group)
    count_answers = Hash.new(0)
    counted_responses = 0

    group.each do |person|
        person.split('').each do |char|
            count_answers[char] += 1
        end
    end

    count_answers.each do |_, value|
        counted_responses += 1 if value == group.size
    end

    counted_responses
end

def create_groups(lines)
    groups = []
    group = []

    lines.each do |line|
        if line == ""
            groups << group
            group = []
        else 
            group << line
        end
    end
    groups << group
end

groups = create_groups(input_lines)
sum_of_the_counts = 0 

groups.each do |group|
    sum_of_the_counts += count_questions(group)
end

puts sum_of_the_counts