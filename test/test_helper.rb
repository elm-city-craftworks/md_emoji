# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

require 'redcarpet'

Turn.config.natural = true
Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

private

def assert_emoji(emoji, text)
  assert include_emoji?(emoji, text), "Emoji not found!"
end

def refute_emoji(emoji, text)
  refute include_emoji?(emoji, text), "Emoji found!"
end

def include_emoji?(emoji, text)
  text.include?(%{<img src="/assets/emojis/#{emoji}.png"})
end