## Part 1
file = File.open('input.txt')
weights = file.readlines.map(&:chomp)
sum = 0

def fuel_required(mass)
    (mass / 3).floor  - 2
end

weights.each do |weight|
    sum += fuel_required(weight.to_i)
end

# Part 2

def total_fuel_required(mass)
    fuel = fuel_required(mass)
    return 0 if fuel <= 0
    fuel += total_fuel_required(fuel)
end

sum = 0
weights.each do |weight|
    sum +=  total_fuel_required(weight.to_i)
end

puts sum