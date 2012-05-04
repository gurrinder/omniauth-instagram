require 'spec_helper'
require 'omniauth-instagram'
describe OmniAuth::Strategies::Instagram do
subject do
    OmniAuth::Strategies::Instagram.new(nil, @options || {})
  end

  it_should_behave_like 'an oauth2 strategy'

  describe '#client' do
    it 'has correct Instagram site' do
      subject.client.site.should eq('https://api.instagram.com')
    end

    it 'has correct authorize url' do
      subject.client.options[:authorize_url].should eq('https://api.instagram.com/oauth/authorize')
    end

    it 'has correct token url' do
      subject.client.options[:token_url].should eq('https://api.instagram.com/oauth/access_token')
    end
  end

  describe '#callback_path' do
    it "has the correct callback path" do
      subject.callback_path.should eq('/auth/instagram/callback')
    end
  end

  describe '#authorize_params' do
    it 'should set default scope to basic' do
      @options = { :authorize_options => [:scope]}
      subject.authorize_params['scope'].should eq('basic')
    end
    it 'should set default response type to code' do
      @options = { :authorize_options => [:response_type]}
      subject.authorize_params['response_type'].should eq('code')
    end
  end
end
