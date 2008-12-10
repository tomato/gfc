class Basket

  attr_reader :items

  def initialize
    @items = {}
    add_validator
  end

  def total_quantity
    items.to_a.inject(0){|total, element| total += element.last}
  end

  def add(product, quantity=1)
    if(@items[product.id])
      @items[product.id] += quantity
    else
      @items[product.id] = quantity
    end
  end

  def remove(product, quantity=1)
    add(product, quantity*-1)
  end

  def update_quantity(product, quantity)
    @items[product.id] = quantity
  end

  private

  def add_validator
    @items.instance_eval do
      def []=(key, value)
        if(value < 0)
          raise ArgumentError, "Quantity cannot be negative", caller 
        elsif(value == 0)
          self.delete key
        elsif(Product.exists?(key))
          super
        else
          raise ArgumentError, "Product Not Found ", caller
        end
      end
    end
  end

end
