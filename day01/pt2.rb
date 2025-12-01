#input = File.readlines("./inputs/day01.txt")

input = File.readlines("./day01/test.txt")

# input = ["L5"]

def parse(line)
    line.chomp!
    [line.chr, line[1..-1].to_i]
end

position = 0
hits_zero = 0
positions = []

input.each do |line|
    direction, distance = parse(line)
    hits_zero += distance.div(100)
    remainder = distance % 100
    case direction
    when "L"
        if position > 0 &&
            (position - remainder) <= 0
            hits_zero += 1
        end
        position = (position - remainder) % 100
    when "R"
        if  (position + remainder) > 99
            hits_zero += 1
        end
        position = (position + remainder) % 100
    end
    pp [line, position, hits_zero]
    positions << position
end

puts hits_zero
# pp positions

