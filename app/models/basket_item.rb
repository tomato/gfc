class BasketItem

  attr_reader :variant, :quantity

  def initialize(a)
    variant,@quantity = a
    @variant = Variant.find(variant.to_i)
  end
  
  def product 
    @variant.product
  end

  def total_price
    @variant.price * @quantity.to_f
  end
end
