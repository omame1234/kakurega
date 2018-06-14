class Room < ApplicationRecord
    has_many :posts
    validates :name,{uniqueness: true}
    validates :name,{presence: true}
end
