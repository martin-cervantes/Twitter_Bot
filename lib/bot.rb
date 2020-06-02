#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'pass.rb'
require 'twitter'

class Bot
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'pPMZjyR2tF82EMkq6wukjEEtt'
      config.consumer_secret = 'AEhX2FKmQv6DRVtzGyTz3Iu2QWhzRbrNlWTkchtnLUyYvRcjmm'
      config.access_token = '1228041719335149568-VWTSWmfjSNZ6gfz94Xfc6i18u3F956'
      config.access_token_secret = 'CzIuqMZhJrqP7RnUDcJWGYrBZpL03hN4c0Kfm8Z0BumpE'
    end
  end

  def search_amlovers
    user = {}

    @client.search('AMLO').take(10_000).each do |tweet|
      if user.key? tweet.user.screen_name
        user[tweet.user.screen_name][0] += 1
        user[tweet.user.screen_name][4] << tweet.full_text
      else
        user[tweet.user.screen_name] = [1,
                                        tweet.user.name,
                                        tweet.user.friends_count,
                                        tweet.user.followers_count,
                                        [tweet.full_text]]
      end
    end

    user = user.sort_by { |_key, value| value }
  end

  def check(friends_count, followers_count)
    if friends_count.zero? || followers_count.zero?
      true
    else
      false
    end
  end
end
