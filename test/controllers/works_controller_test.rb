require "test_helper"

describe WorksController do

  describe "index" do
    it "should get index" do
      get "/works"
      must_respond_with :success
    end
  end

  describe "show" do
    before do
      @work = Work.create(
        category: "movie", 
        title: "hello world", 
        creator: "Yoyo", 
        year: "2020", 
        description: "Very nice"
      )
    end

    it "will get show for valid ids" do
      # Arrange
      valid_work_id = @work.id
      # Act
      get "/works/#{valid_work_id}"
      # Assert
      must_respond_with :success
    end

    it "will respond with not_found for invalid ids" do
      # Arrange
      invalid_work_id = -1
      # Act
      get "/works/#{invalid_work_id}"
      # Assert
      must_respond_with :not_found
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
