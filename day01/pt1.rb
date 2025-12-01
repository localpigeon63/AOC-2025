input = File.readlines("./inputs/day01.txt")

def parse(line)
    line.chomp!
    [line.chr, line[1..-1].to_i]
end

position = 50
positions = []

input.each do |line|
    direction, distance = parse(line)
    case direction
    when "L"
       position = (position -= distance) % 100
    when "R"
        position = (position += distance) % 100
    end
    positions << position
end

puts positions.count(0)