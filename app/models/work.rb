class Work < ApplicationRecord
    has_many :votes
    
    validates :category, presence: true
    validates :title, presence: true

    def self.spotlight
        @works = Work.all
        # if @works.each.votes.count == 0 # if no votes
        #     return Work.create(
        #         category: "TBD", 
        #         title: "TBD", 
        #         creator: "TBD", 
        #         year: "TBD", 
        #         description: "TBD"
        #     )
        # end

        top_voted = @works.max_by { |work| work.votes.count }
        return top_voted
    end

    def self.top_ten(category)
        media = Work.where(category: category)
        top_media = media.sort_by { |work| work.votes.count }.reverse
        if top_media.length < 10
            return top_media.all
        else
            return top_media[0..9]
        end
    end

end
