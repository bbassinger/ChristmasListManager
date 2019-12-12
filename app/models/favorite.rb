class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :list
  belongs_to :favorited, polymorphic: true
end
