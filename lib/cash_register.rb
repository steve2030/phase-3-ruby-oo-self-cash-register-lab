
class CashRegister
  attr_accessor :discount, :total

  def initialize(employee_discount = 0)
    @discount = employee_discount
    @total = 0
    @items = []

  end

  def add_item(item_name, item_price, item_quantity = 1)
    @items << { item_name: item_name, item_price: item_price, item_quantity: item_quantity }
    self.total += item_price * item_quantity
  end

  def apply_discount
    if discount > 0
      self.total = self.total - (self.total * self.discount / 100).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    added_items = []
    @items.each do |item|
      item[:item_quantity].times { added_items << item[:item_name] }
    end

    added_items
  end

  def void_last_transaction
    items.delete(-1)
    self.total -= @items[-1][:item_price] * @items[-1][:item_quantity]
    self.total
  end
end
