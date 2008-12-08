class Basket

  attr_reader :items

  def initialize
    @items = {}
  end

  def count
    @items.count
  end

  def add(product, quantity=1)
    if(Product.exists?(product))
      @items[product.id] = quantity
    end
  end
end
