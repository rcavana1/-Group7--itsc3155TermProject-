class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.string :names
      t.float :target
      t.float :amount
      t.boolean  :reocurring
      t.boolean  :stable
      t.timestamps
    end
  end
end
