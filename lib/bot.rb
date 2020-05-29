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

  def tweet(message)
    @client.update(message)
  end

  def follow(id)
    @client.follow(id)
  end

  def fetch_user(id)
    @client.user(id)
  end

  def search(message)
    @client.search(message)
  end

  def search_amlovers
    user = {}

    @client.search('AMLO').take(10_000).each do |tweet|
      if user.key? tweet.user.screen_name
        user[tweet.user.screen_name] += 1
      else
        user[tweet.user.screen_name] = 1
      end
    end

    user = user.sort_by { |key, value| value }
    user.each { |key, value| p "#{key} = #{value}" }
  end
end
