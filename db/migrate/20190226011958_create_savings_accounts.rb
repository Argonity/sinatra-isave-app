class CreateSavingsAccounts < ActiveRecord::Migration
  def change
    create_table :savings_accounts do |t|
      t.string :item
      t.string :price
      t.string :save_by_date
      t.string :amount_saved
      t.string :priority_level
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
