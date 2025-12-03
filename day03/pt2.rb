input = File.readlines("./inputs/day03.txt")
#input = File.readlines("./day03/test.txt")

joltage = []

def find_number(int, range_start, range_end)
    highest_number = 0
    highest_number_index = 0
    numbers = int.to_s.chars
    numbers[range_start..range_end].each_with_index do |num, index|
        if num.to_i > highest_number
            highest_number = num.to_i
            highest_number_index = range_start + index
        end
    end
    range_start = highest_number_index + 1
    range_end = range_end + 1
    [highest_number, range_start, range_end]
end

def generate_full_number(arr)
    arr.join.to_i
end

input.each do |line|
    line.chomp!
    range_start = 0
    range_end = -12
    highest_numbers = []
    12.times do
        highest_number_and_new_indices = find_number(line, range_start, range_end)
        highest_numbers << highest_number_and_new_indices[0]
        range_start, range_end = highest_number_and_new_indices[1], highest_number_and_new_indices[2]
    end
    joltage << generate_full_number(highest_numbers)
end

puts joltage.sum