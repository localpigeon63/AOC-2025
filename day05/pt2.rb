input = File.readlines("./day05/test.txt")

ranges = []
fresh_ingredient_codes = []

input.each do |range|
    if range.include?("-")
        range_start = range.split("-")[0].to_i
        range_end = range.split("-")[1].chomp.to_i
        ranges << [range_start, range_end]
    end
end

sorted_ranges = ranges.sort
merged_ranges = []

def merge_ranges(range1, range2)
    if range1[0].between?(range2[0], range2[1]) || range2[0].between?(range1[0], range1[1])
        merged_start = [range1[0], range2[0]].min
        merged_end = [range1[1], range2[1]].max
        return [merged_start, merged_end]
    end
end

sorted_ranges.each_with_index do |current_range, index|
    next_range = sorted_ranges[index + 1]
    if next_range == nil
        break
    end
    if merge_ranges(current_range, next_range)
        next_range = merge_ranges(current_range, next_range)
        sorted_ranges.delete_at(index)
    else
        merged_ranges << current_range
    end
end

total = 0
valid_numbers = []

merged_ranges.each do |merged_range|
    valid_numbers << merged_range[0]..merged_range[1]
    total += (merged_range[1] - merged_range[0]) + 1
end

pp merged_ranges
pp valid_numbers
puts total
