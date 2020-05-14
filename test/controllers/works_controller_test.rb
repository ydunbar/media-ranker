require "test_helper"

describe WorksController do
  describe "index" do
    it "should get index" do
      get "/works"
      must_respond_with :success
    end
  end
end

# must_respond_with :success
# must_respond_with :redirect
# must_respond_with :missing
# must_respond_with :error

# must_redirect_to "/"
# must_redirect_to root_path
# must_redirect_to controller: 'post', action: 'index'
