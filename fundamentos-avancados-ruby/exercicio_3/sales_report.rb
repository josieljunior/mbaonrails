class SalesReport
  include Enumerable

  def initialize(sales)
    @sales = sales
  end

  def each(&block)
    @sales.each(&block)
  end

  def total_by_category
    category_totals = Hash.new(0)
    @sales.each do |sale|
      category_totals[sale[:category]] += sale[:amount]
    end
    category_totals
  end

  def top_sales(n)
    @sales.sort_by { |sale| sale[:amount] }.reverse.take(n)
  end

  def grouped_by_category
    @sales.group_by { |sale| sale[:category] }
  end

  def above_average_sales
    total_amount = @sales.sum { |sale| sale[:amount] }
    average_amount = total_amount.to_f / @sales.length

    @sales.select { |sale| sale[:amount] > average_amount }
  end
end

sales = [
  { product: "Notebook", category: "Eletrônicos", amount: 3000 },
  { product: "Celular", category: "Eletrônicos", amount: 1500 },
  { product: "Cadeira", category: "Móveis", amount: 500 },
  { product: "Mesa", category: "Móveis", amount: 1200 },
  { product: "Headphone", category: "Eletrônicos", amount: 300 },
  { product: "Armário", category: "Móveis", amount: 800 }
]

report = SalesReport.new(sales)
puts 'products: '
report.each do |sale|
  puts "#{sale[:category]} - #{sale[:product]} - R$#{sale[:amount]}"
end
puts 'total_by_category: '
puts report.total_by_category

puts 'top_sales: '
puts report.top_sales(2)

puts 'grouped_by_category: '
puts report.grouped_by_category

puts 'above_average_sales:'
puts report.above_average_sales
