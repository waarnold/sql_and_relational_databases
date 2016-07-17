require "Sequel"

DB = Sequel.connect("postgres://localhost/sequel-single-table")

menu = DB[:menu_items]

def format_money(numeric)
  format("$%0.2f", numeric)
end

result = menu.select do
           labor_calc = prep_time / 60.0 * 12
           profit_calc = menu_price - ingredient_cost - labor_calc
           [item, menu_price, ingredient_cost, labor_calc.as(labor), profit_calc.as(profit)]
         end

result.each do |row|
  puts row[:item]
  puts "menu price: #{format_money(row[:menu_price])}"
  puts "ingredient cost: #{format_money(row[:ingredient_cost])}"
  puts "labor: #{format_money(row[:labor])}"
  puts "profit: #{format_money(row[:profit])}"
  puts
end
