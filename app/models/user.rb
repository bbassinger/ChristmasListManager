class User < ApplicationRecord
    has_secure_password
    has_many :lists
     has_many :favorites
  has_many :favorite_projects, through: :favorites, source: :lists, source_type: 'Project'
end