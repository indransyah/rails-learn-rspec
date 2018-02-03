require 'rails_helper'

RSpec.describe 'Learn' do
  it 'do sum' do
    result = 8 + 2
    expect(result).to(eq(10))
  end
end