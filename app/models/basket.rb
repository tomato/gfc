class Basket

  attr_reader :items

  def initialize
    @items = {}
    add_validator
  end

  def total_quantity
    total_quantity = 0
    items.each{|key,value| total_quantity += value}
    total_quantity
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
    if(@items.has_key?(product.id))
      @items[product.id] = quantity
    else
      raise ArgumentException, "Product Not Found ", caller
    end
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
        end
      end
    end
  end

end
