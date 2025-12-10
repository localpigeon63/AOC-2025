input = File.readlines("./inputs/day04.txt")

offset = input[0].chomp.length

all_lines = []

input.each do |line|
    all_lines << line.chomp
end

full_input = all_lines.flatten
full_input = full_input.join.chars

valid_spaces = 0

full_input.each_with_index do |char, index|
    if char != "@"
        next
    end

    counter = 0
    values = [
            index - 1,
            index + 1,
            index + offset,
            index - offset,
            (index + offset) + 1,
            (index - offset) + 1,
            (index + offset) - 1,
            (index - offset) - 1
            ]
    valid_values = []
    current_row = index / offset
    current_column = index % offset
    values.each do |value|
        if value < 0 || value >= full_input.length
            next
        elsif 
            (value/offset - current_row).abs > 1 || (value % offset - current_column).abs > 1
            next
        else
        valid_values << full_input[value]
        end
    end
    if valid_values.count("@") < 4
        valid_spaces += 1
    end
end

puts valid_spaces