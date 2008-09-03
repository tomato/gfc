@home_dir = File.join(File.dirname(__FILE__), "../..", "db/backup/")
@tables = ['producers', 'questions', 'answers', 'images']

namespace :lockup do
  desc 'Save models to yaml'
  task :save => :environment do
    @tables.each do | t |
      puts "Backing up #{t}"
      open(storage_path(t),"w") do |f|
        f.puts eval(t.singularize.capitalize).find(:all).to_yaml
      end
    end
  end

  desc 'Load models from saved yaml'
  task :load => :environment do
    @tables.each do |t|
      puts "Loading up #{t}"
      eval(t.singularize.capitalize).exists?(1) #Dirty hack that seems to force load the model
      models = open(storage_path(t)){ |f| YAML.load(f.read) }
      models.each do |p| 
        p = p.clone unless eval(t.singularize.capitalize).exists?(p.id)
        puts "#{p.errors.full_messages} for #{p.id}"  unless(p.save)
      end
    end
  end

  def storage_path(table)
    @home_dir + table + ".yaml"
  end
end

