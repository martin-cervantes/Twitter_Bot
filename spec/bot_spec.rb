# frozen_string_literal: true

require_relative '../lib/bot.rb'

describe Bot do
  let(:bot) { Bot.new }

  describe '#search_amlovers' do
    it 'Check if not Integer' do
      expect(bot.search_amlovers).to_not eql(Integer)
    end

    it 'Check if not String' do
      expect(bot.search_amlovers).to_not eql(String)
    end

    it 'Check if return key and values' do
      expect(bot.search_amlovers).to include(a_kind_of(Array))
    end
  end

  describe '#check if is a bot' do
    it 'check if no following and no followers' do
      expect(bot.check(0, 0)).to eql(true)
    end

    it 'check if no following but followers' do
      expect(bot.check(0, 1)).to eql(true)
    end

    it 'check if following but no followers' do
      expect(bot.check(1, 0)).to eql(true)
    end

    it 'check if following and followers' do
      expect(bot.check(1, 1)).to eql(false)
    end
  end
end
