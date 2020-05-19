class Work < ApplicationRecord

    def self.top_ten(category)
        media = Work.where(category: category)
        top_media = media # .sort by votes
        if top_media.length < 10
            return top_media.all
        else
            return top_media[0..9]
        end
    end

end
