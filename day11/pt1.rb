input = File.readlines("./inputs/day11.txt")

connections = input.inject({}) do |temp_hash, line|
    key, merged_values = line.chomp.split(": ")
    values = merged_values.split(" ")
    temp_hash[key] = values
    temp_hash
end

route_finder = []
paths = 0

connections["you"].each do |value|
    route_finder.push(value)
end

route_finder.each do |coordinate|
    connections[coordinate].each do |c|
        if c == "out"
            paths += 1
        else
            route_finder.push(c)
        end
    end
end

puts paths
