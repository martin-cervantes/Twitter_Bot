#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/bot.rb'

bot = Bot.new

user = bot.search_amlovers

user.each { |key, value| "#{key} = #{value[0]}" }
