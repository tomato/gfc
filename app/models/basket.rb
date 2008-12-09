class Basket

  attr_reader :items

  def initialize
    @items = {}
  end

  def total_quantity
    total_quantity = 0
    items.each{|key,value| total_quantity += value}
    total_quantity
  end

  def add(product, quantity=1)
    if(Product.exists?(product))
      if(@items[product.id])
        @items[product.id] += quantity
      else
        @items[product.id] = quantity
      end
      if(@items[product.id] < 0)
       @items[product.id] -= quantity
       raise ArgumentError, "Quantity cannot be negative", caller 
      end
      if(@items[product.id] == 0)
        @items.delete product.id
      end
    end
  end

  def remove(product, quantity=1)
    add(product, quantity*-1)
  end

  def update_quantity(product, quantity)
    if(@items.has_key?(product.id) && quantity > 0)
      @items[product.id] = quantity
    else
      raise ArgumentException, "Product Not Found or quantity negative", caller
    end
  end

end
