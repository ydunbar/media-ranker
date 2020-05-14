require "test_helper"

describe UsersController do

  describe "index" do
    it "should get index" do
      get "/works"
      must_respond_with :success
    end
  end

  describe "show" do
    before do
      @user = User.create(username: "Yoyo")
    end

    it "will get show for valid ids" do
      # Arrange
      valid_user_id = @user.id
      # Act
      get "/users/#{valid_user_id}"
      # Assert
      must_respond_with :success
    end

    it "will respond with not_found for invalid ids" do
      # Arrange
      invalid_user_id = -1
      # Act
      get "/users/#{invalid_user_id}"
      # Assert
      must_respond_with :not_found
    end
  end

end
