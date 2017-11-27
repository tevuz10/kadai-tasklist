require 'spec_helper'

RSpec.describe 'describe(1) eeee' do
  describe 'describe(2) 1 + 1 = 2' do
    context 'context(1) 1 + 1 = 2' do
      it '1 + 1 = 2' do
        expect(1+1).to eq 2
      end
    end
  end
  describe '10 - 1 = 9' do
    context '10 - 1 = 9' do
      it '10 - 1 = 9' do
        expect(10-1).to eq 0
      end
    end 
  end
end
