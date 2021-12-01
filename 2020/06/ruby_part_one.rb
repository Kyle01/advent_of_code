file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

def count_questions(group)
    unique_answers = []

    group.each do |person|
        person.split('').each do |char|
            unique_answers << char unless unique_answers.include?(char)
        end
    end

    unique_answers.size
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