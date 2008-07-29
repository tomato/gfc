require 'active_record/fixtures'

class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :name
      t.boolean :required

      t.timestamps
    end

    Fixtures.create_fixtures("#{File.dirname(__FILE__)}/dev_data","questions")
  end

  def self.down
    drop_table :questions
  end
end
