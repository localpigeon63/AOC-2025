input = File.readlines("./inputs/day06.txt")

matrix = input.map do |line|
            line.chomp.strip.split(/ +/)
end

matrix = matrix.transpose

total = 0

matrix.each do |problem|
    numbers = problem[0..-2].map do |number|
            number.to_i
    end
    case problem[-1]
    when "+"
        total += numbers.sum
    when "*"
        total += numbers.reduce(:*)
    end
end

puts total
