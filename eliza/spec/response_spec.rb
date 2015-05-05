require_relative 'spec_helper'
require_relative '../lib/response'

RSpec.describe 'Eliza answers' do
  Response.add_response 'foo', 'foo response'
  Response.add_response 'bar', 'bar1', 'bar2'
  Response.add_dummies 'Tell me more', "That's interesting.", 'Go on'

  describe 'Can retrieve answers' do
    it 'returns the single response when there is one' do
      expect(Response.get_answer 'foolish').to eq 'foo response'
    end

    it 'returns one of the answers when there are two' do
      expect(['bar1', 'bar2']).to include Response.get_answer('barfly')
    end

    it 'returns a dummy response when there is no match' do
      expect(['Tell me more', "That's interesting.", 'Go on']).to include(
          Response.get_answer('blergh'))
    end
  end
end
