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
end
