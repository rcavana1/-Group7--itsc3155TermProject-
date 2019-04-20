class AddBudgetToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_reference :expenses, :budget, foreign_key: true
  end
end
