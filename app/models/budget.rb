class Budget < ApplicationRecord
    validates :month, presence: true
    validates :target, presence: true
end
