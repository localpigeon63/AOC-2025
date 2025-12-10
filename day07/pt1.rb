input = File.readlines("./inputs/day07.txt", chomp: true)

def find_first_beam(first_line)
    beam_index = first_line.chars.index("S")
end

beam_array = [find_first_beam(input[0])]
split_counter = 0

input[1..-1].each do |line|
    positions = line.chars
    new_beam_array = []
    beam_array.each do |beam|
        if positions[beam] == "^"
            new_beam_array << beam + 1 
            new_beam_array << beam - 1
            split_counter += 1
        else new_beam_array << beam
        end
    end
    beam_array = new_beam_array.uniq
end

puts split_counter