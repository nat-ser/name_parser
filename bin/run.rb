# frozen_string_literal: true
require "bundler/setup"
require "csv"

Bundler.require(:default, :development)

$LOAD_PATH << "."

Dir["lib/*.rb"].each { |f| require f }

#### comment below 2 lines out if you want to run manually
ApplicationController.auto_run
puts "done, check 'output.csv' for your sorted output."

#### configure settings here
# input_path = "spec/fixtures/input_pipe.csv"
# output_path = "outcdput.csv"
# opts = { birth_date: "desc", last_name: "desc" }

# begin
# 	ApplicationController.convert(input_path, output_path, opts)
# rescue StandardError => e
#  	puts "\nOops, did not parse. Your input failed with error: #{e}"
# end
