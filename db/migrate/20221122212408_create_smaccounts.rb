class CreateSmaccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :smaccounts do |t|
      t.string :appn
      t.integer :time_use
      t.integer :user_id  

      t.timestamps
    end
  end
end
