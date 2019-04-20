class Budget < ApplicationRecord
    # belongs_to :account
    has_many :incomes
    has_many :expenses
    validates :month, presence: true
    validates :target, presence: true
end
