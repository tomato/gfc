class AddProducerContactDetails < ActiveRecord::Migration
  def self.up
    add_column :producers, :address, :string, :limit => 500
    add_column :producers, :website, :string
    add_column :producers, :email, :string
    add_column :producers, :tel, :string
  end

  def self.down
    remove_column :producers, :address
    remove_column :producers, :website
    remove_column :producers, :email
    remove_column :producers, :tel
  end
end
