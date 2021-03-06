class Basket

  attr_reader :items

  def initialize
    @items = {}
    add_validator @items
  end
  
  def marshal_dump
    {}.merge @items
  end

  def marshal_load(variables)
    initialize
    @items.merge! variables
  end

  def total_quantity
    items.to_a.inject(0){|total, element| total += element.last}
  end

  def add(variant, quantity=1)
    if(@items[variant])
      @items[variant] += quantity.to_i
    else
      @items[variant] = quantity
    end
  end

  def remove(variant, quantity=1)
    add(variant, quantity.to_i*-1)
  end

  def update_quantity(variant, quantity)
    @items[variant] = quantity
  end

  private

  def add_validator(hash)
    hash.instance_eval do
      def []=(key, value)
        k = (key.kind_of? ActiveRecord::Base) ? key.id : key.to_i
        v = value.to_i
        if(v < 0)
          raise ArgumentError, "Quantity cannot be negative", caller 
        elsif(v == 0)
          self.delete k
        elsif(Variant.exists?(k))
          super k, v
        else
          raise ArgumentError, "Product Variant Not Found ", caller
        end
      end
      def [](key)
        k = (key.kind_of? ActiveRecord::Base) ? key.id : key.to_i
        super k
      end
    end
  end

end
