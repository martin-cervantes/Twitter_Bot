#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/bot.rb'

bot = Bot.new

user = bot.search_amlovers

user.each { |key, value| "#{key} = #{value[0]}" }

p 'posible bots'
user.each { |key, value| p "#{key} = #{value[0]}" if bot.check(value[2], value[3]) }
