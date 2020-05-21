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

  describe "new" do
    it "can get the new_work_path" do
      get new_work_path

      must_respond_with :success
    end
  end

  describe "create" do

    let (:work_hash) {
      {
        work: {
          category: "book",
          title: "Practical Object Oriented Programming in Ruby",
          creator: "Sandi Metz",
          year: "1990",
          description: "A look at how to design object-oriented systems"
        }
      }
    }

    it "can create a work" do
      expect {
        post works_path, params: work_hash
      }.must_differ 'Work.count', 1
  
      must_respond_with  :redirect
      must_redirect_to root_path
      expect(Work.last.category).must_equal work_hash[:work][:category]
      expect(Work.last.title).must_equal work_hash[:work][:title]
      expect(Work.last.creator).must_equal work_hash[:work][:creator]
      expect(Work.last.description).must_equal work_hash[:work][:description]
    end

    it "will not create a work with invalid params" do
      work_hash[:work][:title] = nil

      expect {
        post works_path, params: work_hash
      }.must_differ "Work.count", 0

      must_respond_with :bad_request
    end
  end

  describe "update" do

    let (:new_work_hash) {
      {
        work: {
          category: "book",
          title: "A Wrinkle in Time",
          creator: "Madeleine Lengle",
          year: "1980",
          description: "A fabulous adventure",
        },
      }
    }
    it "will update a model with a valid post request" do
      id = work.first.id
      expect {
        patch work_path(id), params: new_work_hash
      }.wont_change "Work.count"
  
      must_respond_with :redirect
  
      work = Work.find_by(id: id)
      expect(Work.last.category).must_equal work_hash[:work][:category]
      expect(Work.last.title).must_equal work_hash[:work][:title]
      expect(Work.last.creator).must_equal work_hash[:work][:creator]
      expect(Work.last.description).must_equal work_hash[:work][:description]
    end
  
    it "will respond with not_found for invalid ids" do
      id = -1
  
      expect {
        patch work_path(id), params: new_work_hash
      }.wont_change "Work.count"
  
      must_respond_with :not_found
    end
  
    it "will not update if the params are invalid" do
      new_work_hash[:work][:title] = nil
      work = Work.first

      expect {
        patch work_path(work.id), params: new_work_hash
      }.wont_change "Work.count"

      work.reload # refresh the work from the database
      must_respond_with :bad_request
      expect(work.title).wont_be_nil
    end
  end

  describe "destroy" do
    it "destroys existing work in db and redirects" do

      work = Work.create(
        category: "book",
        title: "A Wrinkle in Time",
        creator: "Madeleine Lengle",
        year: "1980",
        description: "A fabulous adventure",
      )

      expect {
        delete work_path(work.id)
      }.must_differ 'Work.count', -1

      must_respond_with :redirect

      it "does not change db when work doesn't exist, and responds with not_found" do
        invalid_id = -1

        expect {
          delete work_path(invalid_id)
        }.wont_change 'Work.count'

        must_respond_with :not_found
      end

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
