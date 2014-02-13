require 'spec_helper'

describe MarkupDevController do

  describe "GET 'css'" do
    it "returns http success" do
      get 'css'
      response.should be_success
    end
  end

  describe "GET 'components'" do
    it "returns http success" do
      get 'components'
      response.should be_success
    end
  end

  describe "GET 'js'" do
    it "returns http success" do
      get 'js'
      response.should be_success
    end
  end

end
