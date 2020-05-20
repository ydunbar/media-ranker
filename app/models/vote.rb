class Vote < ApplicationRecord
    belongs_to :work, :user

    validates :user_id, uniqueness: { scope: :work_id }
end
