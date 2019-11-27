class List < ApplicationRecord
    belongs_to :user
    
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
