input = File.read("./inputs/day12.txt")

presents = {}

input_parts = input.split("\n\n")

input_parts[0..-2].each do |entry|
    presents[entry.split(":")[0]] = entry.count("#")
end

instructions = input_parts[-1].split("\n").map do |line|
    line.split(":")
end

valid_regions = 0

instructions.each do |line|
    num_1, num_2 = line[0].split("x")
    region_area = num_1.to_i * num_2.to_i
    present_numbers = line[1].strip.chomp.split(" ")
    presents_area = 0
    present_numbers.each_with_index do |number, index|
        presents_area += number.to_i * presents[index.to_s].to_i
    end
    if presents_area <= region_area
        valid_regions += 1
    end
end

puts valid_regions