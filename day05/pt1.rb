input = File.readlines("./inputs/day05.txt")

fresh_ingredient_codes = []
ingredients_for_checking = []

input.each do |str|
    if str.include?("-")
        fresh_ingredient_codes << [str.split("-")[0].to_i, str.split("-")[1].chomp.to_i]
    else
        ingredients_for_checking << str.chomp.to_i
    end
end

fresh_ingredient_codes = fresh_ingredient_codes.uniq
fresh_ingredients_found = 0

ingredients_for_checking.each do |id|
    fresh_ingredient_codes.each do |range|
        if id >= range[0] &&
            id <= range[1]
            fresh_ingredients_found += 1
            break
        end
    end
end

puts ingredients_for_checking.count
pp fresh_ingredients_found