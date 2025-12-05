input = File.readlines("./inputs/day05.txt")

ranges_for_parsing = []
fresh_ingredient_codes = []

input.each do |str|
    if str.include?("-")
        ranges_for_parsing << str
    end
end

ranges_for_parsing.each do |range|
    range_start = range.split("-")[0].to_i
    range_end = range.split("-")[1].chomp.to_i
    (range_start..range_end).each do |num|
        fresh_ingredient_codes << num
    end
end

fresh_ingredient_codes = fresh_ingredient_codes.uniq

puts fresh_ingredient_codes.count