input = File.readlines("./day04/test.txt")

offset = input[0].chomp.length

all_lines = []

input.each do |line|
    all_lines << line.chomp
end

full_input = all_lines.flatten
full_input = full_input.join.chars

pp full_input

valid_spaces = 0

full_input.each_with_index do |char, index|
    if char != "@"
        next
    end
    counter = 0
    values = [
            full_input[index - 1],
            full_input[index + 1],
            full_input[index + offset],
            full_input[index - offset],
            full_input[(index + offset) + 1],
            full_input[(index - offset) + 1],
            full_input[(index + offset) - 1],
            full_input[(index - offset) - 1]
            ]
    pp values
    if char == "@" && values.count("@") < 4
        valid_spaces += 1
    end
end

puts valid_spaces