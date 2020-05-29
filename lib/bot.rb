#!/usr/bin/env ruby

# frozen_string_literal: true

require 'twitter'

class Bot
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'YOUR_CONSUMER_KEY'
      config.consumer_secret = 'YOUR_CONSUMER_SECRET'
      config.access_token = 'YOUR_ACCESS_TOKEN'
      config.access_token_secret = 'YOUR_ACCESS_SECRET'
    end
  end
end
