class User < ApplicationRecord
    has_many :votes
    
    validates :username, presence: true

    def self.sorted
        @users = User.all
        sorted_users = @users.sort_by { |user| user.created_at }
        return sorted_users
    end
end
