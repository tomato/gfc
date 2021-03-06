class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.text :text
      t.references :producer, :null => false
      t.references :question, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
