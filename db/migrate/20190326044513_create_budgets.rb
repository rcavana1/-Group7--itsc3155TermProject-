class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.date :month
      t.float :target
      t.float :total

      t.timestamps
    end
  end
end
