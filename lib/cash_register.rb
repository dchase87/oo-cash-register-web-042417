class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(*discount)
    @total = 0
    @items = []
    @discount = discount[0]
  end

  def last_transaction
    @last_transaction = []
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    quantity.times {@items << title}
    last_transaction.unshift(price)
  end

  def apply_discount
    if @discount != nil
      @total -= (@total * (@discount * 0.01))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction[0]
  end
end
