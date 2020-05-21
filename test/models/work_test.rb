require "test_helper"

describe Work do
  let (:new_work) {
    Work.new(
      category: "movie", 
      title: "hello world", 
      creator: "Yoyo", 
      year: "2020", 
      description: "Very nice"
    )
  }
  it "can be instantiated" do
    expect(new_work.valid?).must_equal true
  end

  it "will have the required fields" do
    new_work.save
    work = Work.first
    [:category, :title, :creator, :year, :description].each do |field|
      expect(work).must_respond_to field
    end
  end

  describe "relationships" do
    it "can have many votes" do
      new_work.save
      # TODO: add users, and add user votes, expect work.votes count to go up
      # expect vote to be instance of vote
    end
  end

  describe "validations" do
    it "must have a category" do
      new_work.category = nil

      expect(new_work.valid?).must_equal false
      expect(new_work.errors.messages).must_include :category
    end

    it "must have a title" do
      new_work.title = nil

      expect(new_work.valid?).must_equal false
      expect(new_work.errors.messages).must_include :title
    end
  end

  # TODO: custom methods
end
