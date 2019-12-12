class List < ApplicationRecord
    belongs_to :user
    
    has_many :favorites # just the 'relationships'
  has_many :favorited_by, through: :favorites, source: :user # the actual users favoriting a recipe

    def self.search(search)
        if search 
            user = User.find_by(username: search)
            if user
                self.where(user_id: user)
            else
                List.all
            end
        else
            List.all
        end
    end
end
