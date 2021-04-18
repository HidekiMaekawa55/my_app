require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let(:user) { create(:user) }
  
  describe 'account_activation' do
    let(:mail) { UserMailer.account_activation(user) }

    it 'renders the headers' do
      aggregate_failures do
        expect(mail.subject).to eq 'Account activation'
        expect(mail.to).to eq [user.email]
        expect(mail.from).to eq ['manager@njs.com']
      end
    end
    it 'renders the body' do
      aggregate_failures do
        expect(mail.body.encoded).to match user.name
        expect(mail.body.encoded).to match user.activation_token
        expect(mail.body.encoded).to match CGI.escape(user.email)
      end
    end
  end
  
  describe 'password_reset' do
  end
end