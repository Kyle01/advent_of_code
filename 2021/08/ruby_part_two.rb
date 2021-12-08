file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def create_decoder(line)
  unique_length = [2, 3, 4, 7]
  decoder = {}
  line.split(' ').each do |word|
    if word.length == 2
        decoder[1] = word
    elsif word.length == 3
        decoder[7] = word
    elsif word.length == 4
        decoder[4] = word
    elsif word.length == 7
        decoder[8] = word
    end
  end

  line.split(' ').each do |word|
    next if unique_length.include?(word.length)
    if word.length == 6
        if decoder[4].split('').all? { |e| word.split('').include?(e) }
            decoder[9] = word
        elsif decoder[1].split('').all? { |e| word.split('').include?(e) }
            decoder[0] = word
        else 
            decoder[6] = word
        end
    else
        if decoder[1].split('').all? { |e| word.split('').include?(e) }
            decoder[3] = word
        end
    end
  end

  line.split(' ').each do |word|
    next if word.length != 5 
    next if word == decoder[3]
    if word.split('').include?(decoder[1].split('').intersection(decoder[6].split(''))[0])
        decoder[5] = word
    else
        decoder[2] = word
    end
  end
  
  solution = Hash.new
  decoder.each do |key, value|
    solution[value.split('').sort.join] = key
  end
  solution
end

output_values = []
lines.each do |line|
    secret_key = line.split(' | ')[0]
    code = line.split(' | ')[1]

    decoder = create_decoder(secret_key)
    solution = ""

    code.split(" ").each do |word|
        word = word.split('').sort.join
        solution << decoder[word].to_s
    end
    output_values << solution.to_i
end

puts output_values.reduce(:+)
