namespace :ya_map do
  namespace :generate do
    desc "Generates API key YML file under config directory."
    task :yml do
      dest_path = "#{RAILS_ROOT}/config/ya-map-api-key.yml"
      File.open dest_path, 'w' do |f|
        f << File.read(File.dirname(__FILE__) + '/../../config/ya-map-api-key.yml')
      end
      puts "API File #{dest_path} generated successfully"
    end
  end
end
