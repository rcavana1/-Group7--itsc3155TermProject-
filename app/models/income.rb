class Income < ApplicationRecord
    belongs_to :budget
    validates_presence_of :names
    validates_numericality_of :amount, :message=>"Input a valid number"
    
end
