require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
end

Cucumber::Rake::Task.new(:focus) do |t|
  t.profile = 'focus'
end

task :default => :features
task :cucumber => :features
