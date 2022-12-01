lines = File.open('input.txt').readlines.map(&:chomp)

k = 0 
elves = []
elf = [] 
while k < lines.size 
    unless lines[k].empty?
        elf << lines[k].to_i
    else 
        elves << elf 
        elf = []
    end
    k += 1 
end 
puts elves.map {|elf| elf.inject(:+) }.sort[-3..-1].inject(:+)
