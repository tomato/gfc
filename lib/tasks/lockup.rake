namespace :lockup do
  desc 'Save Producers to yaml'
  task :save => :environment do
    puts 'Persisting Producers'
    open("producers.yaml","w"){|f| f.puts Producer.find(:all).to_yaml}
  end

  desc 'Load Producers from saved yaml'
  task :load => :environment do
    puts 'Loading up Producers'
    producers = open("producers.yaml"){ YAML.load(f.read) }
    producers.each{|p| p.save! }
  end
end

