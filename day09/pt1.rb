input = File.readlines("./inputs/day09.txt")

coordinates = input.map do |line|
    x, y = line.chomp.split(",")
    [x.to_i, y.to_i]
end

largest_area = 0

coordinates.each_with_index do |pair, index|
    x, y = pair
    coordinates[index+1..-1].each do |next_pair|
        next_x, next_y = next_pair
        area = ((x-next_x).abs+1) * ((y-next_y).abs+1)
        largest_area = [largest_area, area].max
    end
end

puts largest_area