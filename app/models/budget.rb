class Budget < ApplicationRecord
    belongs_to :user
    has_many :incomes, dependent: :destroy
    has_many :expenses, dependent: :destroy
    validates :month, presence: true
    validates :target, presence: true
end
