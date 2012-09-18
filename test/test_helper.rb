# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

require 'redcarpet'
require 'capybara/rails'

Turn.config.natural = true
Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

private

def assert_emoji(emoji, text)
  assert include_emoji?(emoji, text), "Emoji (#{emoji}) not found!"
end

def refute_emoji(emoji, text)
  refute include_emoji?(emoji, text), "Emoji (#{emoji}) found!"
end

def include_emoji?(emoji, text)
  emoji = emoji.gsub('+', 'plus')
  text.include?(%{<img src="/assets/emojis/#{emoji}.png"})
end