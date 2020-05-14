require "test_helper"

describe UsersController do
  describe "index" do
    it "should get index" do
      get "/works"
      must_respond_with :success
    end
  end
end
