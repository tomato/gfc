require 'active_record/fixtures'

class LoadProducerData < ActiveRecord::Migration
  def self.up
    down
    directory = File.dirname(__FILE__) + '/dev_data/'
    Fixtures.create_fixtures(directory,"producers");
  end

  def self.down
    Producer.delete_all
  end
end
