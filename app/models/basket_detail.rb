class BasketDetail
  attr_reader :items

  def initialize(basket)
    @items = basket.items.inject([]) do |bi, i|
      bi << BasketItem.new(i)
    end
  end

  def total_price
    @items.inject(0.0)do |t,i|
      t += i.total_price
    end
  end

  def total_quantity
    @items.inject(0)do |t,i|
      t += i.quantity
    end
  end

end
