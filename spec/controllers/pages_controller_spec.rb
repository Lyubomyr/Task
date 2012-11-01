require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'price'" do
    it "returns http success" do
      get 'price'
      response.should be_success
    end
  end

end
