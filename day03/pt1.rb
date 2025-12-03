input = File.readlines("./inputs/day03.txt")

joltage = []

def find_first_number(int)
    highest_number = 0
    highest_number_index = 0
    numbers = int.to_s.chars
    numbers[0..-2].each_with_index do |num, index|
        if num.to_i > highest_number
            highest_number = num.to_i
            highest_number_index = index
        end
    end
    [highest_number, highest_number_index]
end

def find_second_number(int, index)
    highest_number = 0
    numbers = int.to_s.chars
    numbers[index+1..-1].each_with_index do |num, index|
        if num.to_i > highest_number
            highest_number = num.to_i
        end
    end
    highest_number
end

input.each do |line|
    line.chomp!
    first_number, first_number_index = find_first_number(line)
    second_number = find_second_number(line, first_number_index)
    joltage << (first_number * 10 + second_number)
end

puts joltage.sum