lines = File.open('input.txt').readlines.map(&:chomp)

x = 1
cycle = 1

key_signals = [20, 60, 100, 140, 180, 220]
signals = []
puts "#{cycle} - n/a - #{x}"
lines.each_with_index do |line, i|
    code = line.split(' ')[0]

    if code == 'noop'
        cycle += 1
    else
        cycle += 1
        signals << cycle * x if key_signals.include?(cycle)
        cycle += 1
        x += line.split(' ')[1].to_i
    end

    signals << cycle * x if key_signals.include?(cycle)
    puts "#{cycle} - #{line} - #{x}"
end

puts signals.reduce(:+)