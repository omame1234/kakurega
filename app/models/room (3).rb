class Room < ApplicationRecord
    has_many :posts
    validates :key,{presence: true}
end
