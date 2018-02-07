# frozen_string_literal: true

require "bundler/setup"
require "csv"

$LOAD_PATH << "."

Dir["lib/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.color = true

  config.tty = true

  config.formatter = :documentation
end
