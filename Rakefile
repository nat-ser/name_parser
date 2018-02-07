# frozen_string_literal: true

require "rake"
require "rspec/core/rake_task"
require "rubocop/rake_task"

desc "Run parser program"
task :run do
  ruby "bin/run.rb"
end

desc "Run rubocop"
RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ["--display-cop-names"]
end
