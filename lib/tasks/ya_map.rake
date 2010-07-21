namespace :ya_map do
  namespace :copy do
    desc "Copies API key YML file."
    task :yml do
      dest_path = "#{RAILS_ROOT}/config/ya-map-api-key.yml"
      File.open dest_path, 'w' do |f|
        f << File.read(File.dirname(__FILE__) + '/../../config/ya-map-api-key.yml')
      end
      puts "API File #{dest_path} copied successfully"
    end
    desc "Copies necessary JS files."
    task :js do
      dest_path = "#{RAILS_ROOT}/public/javascripts/ya-map.js"
      File.open dest_path, 'w' do |f|
        f << File.read(File.dirname(__FILE__) + '/../../public/javascripts/ya-map.js')
      end
      puts "JS File #{dest_path} copied successfully"
    end
  end
  desc "Performs all necessary task to get YaMap up and running."
  task :install => ['ya_map:copy:js', 'ya_map:copy:yml']
end
