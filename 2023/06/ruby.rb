data = [[59796575, 597123410321328]]
solutions = []

data.each do |race|
    time = race[0]
    distance = race[1]

    possible_solutions = []
    k = 1 
    while k < time 
        possible_solutions << (time - k) * k 
        k += 1
    end

    solutions << possible_solutions.count{|x| x > distance}
end

answer = solutions.reduce(:*)
puts answer