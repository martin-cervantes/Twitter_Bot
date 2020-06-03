#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/bot.rb'

bot = Bot.new

user = bot.search_amlovers

loop do
  system 'cls'

  puts "\n* * * * * * * * * * * * *  * * * * *"
  puts "* * *       Bot Identifier     * * *"
  puts "* * * * * * * * * * * * *  * * * * *\n\n"
  puts 'User ID                # of tweets'
  user.each { |key, value| puts "#{key} = #{value[0]}" }

  puts "\n* * *   posible bots   * * *\n"
  user.each { |key, value| p "#{key} = #{value[0]}" if bot.check(value[2], value[3]) }

  puts "\nWould you like to check the information of a user?? (y|n)"
  resp = gets.chomp

  case resp
  when 'y' || 'Y'
    puts "\nEnter the user id"
    resp = gets.chomp

    user.each do |key, value|
      if key.eql?(resp)

        puts "\n* * * * * * * * * * * * * * * * * * * *"
        puts "\nUser information\n\n"
        puts "ID  => #{key}"
        puts "Name => #{value[1]}"
        puts "tweet(s)  => #{value[0]} "
        puts "following => #{value[2]} "
        puts "followers => #{value[3]} "
        puts '=>Full text'
        for t in value[4]
          puts "=> #{t}"
        end
      end
    end
  end

  puts 'Would like to exit? (y|n)'
  resp = gets.chomp

  break if resp.eql?('y')
end
