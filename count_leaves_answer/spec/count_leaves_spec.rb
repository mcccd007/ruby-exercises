require_relative 'spec_helper'
require_relative '../lib/count_leaves'

RSpec.describe CountLeaves do
  c = CountLeaves.new

  it 'Can Count Empty Hash or Array' do
    expect(c.count_leaves []).to eq 0
    expect(c.count_leaves({})).to eq 0
  end

  it 'Can count simple Hash or Array' do
    expect(c.count_leaves [1, 2, 3]).to eq 3
    expect(c.count_leaves a: 1, b: 2, c: 3).to eq 3
  end

  it 'Can count mixtures of hashes and arrays' do
    expect(c.count_leaves [1, 2, {a: 1}]).to eq 3
    expect(c.count_leaves a: 1, b: [1, 2]).to eq 3
    expect(c.count_leaves [{a: 1}, {a: 1}]).to eq 2
    expect(c.count_leaves a: [1], b: [2, 3]).to eq 3
    expect(c.count_leaves [1, 2, [], {a: 1}]).to eq 3
    expect(c.count_leaves a: [], b: 1).to eq 1
  end
end
