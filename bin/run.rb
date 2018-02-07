# frozen_string_literal: true
require "bundler/setup"
require "csv"
require_relative "initializer.rb"

Bundler.require(:default, :development)

$LOAD_PATH << "."

Dir["lib/*.rb"].each { |f| require f }

if @input_path && @output_path && @opts
 ApplicationController.convert(input_path: @input_path, output_path: @output_path, opts: @opts)
 puts "done, check #{@output_path} for your sorted output."
else
  puts "since you have not set the variables in initializer.rb, program is running with defaults for your convenience"
  ApplicationController.auto_run
  puts "done, check 'output.csv' for your sorted output."
end
