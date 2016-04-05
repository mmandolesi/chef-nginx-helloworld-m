require 'kitchen'
require 'rubocop/rake_task'
require 'foodcritic'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new
FoodCritic::Rake::LintTask.new

desc 'Run ChefSpec unit tests'
RSpec::Core::RakeTask.new(:unit) do |t|
  t.pattern = './**/unit/**/*_spec.rb'
end

desc 'Run kitchen test'
task :default do
  Kitchen.logger = Kitchen.default_file_logger
  @loader = Kitchen::Loader::YAML.new(project_config: './.kitchen.yml')
  config = Kitchen::Config.new(loader: @loader)
  config.instances.each do |instance|
    instance.test(:always)
  end
end
