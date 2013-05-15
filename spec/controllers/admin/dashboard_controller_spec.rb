require 'spec_helper'

describe Admin::DashboardController do
  describe 'authorization' do
    it 'should redirect to app root' do
      sign_in FactoryGirl.create(:confirmed_user)
      get :index
      response.code.should == '302'
      response.should redirect_to(root_url)
    end

    it 'should be success for admin user' do
      sign_in FactoryGirl.create(:admin_user)
      get :index
      response.should be_success
    end
  end
end