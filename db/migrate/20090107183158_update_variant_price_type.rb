class UpdateVariantPriceType < ActiveRecord::Migration
  def self.up
    change_column :variants, :price, :decimal , :precision => 6, :scale => 2
  end

  def self.down
    change_column :variants, :price, :integer
  end
end
