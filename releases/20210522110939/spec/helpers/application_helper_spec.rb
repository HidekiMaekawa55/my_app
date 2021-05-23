require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#full_title' do
    it { expect(full_title('')).to eq 'NJS' }
    it { expect(full_title('開発者紹介')).to eq '開発者紹介 | NJS' }
  end
end