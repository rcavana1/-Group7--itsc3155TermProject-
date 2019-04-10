class Account < ApplicationRecord
    #has_many :budgets
    validates :username, presence: true, length: { minimum: 3 }
    validates :password, presence: true, length: { minimum: 8 }
    validates :name, presence: true, length: { minimum: 2 }
end
