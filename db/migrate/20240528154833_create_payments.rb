class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.decimal :value
      t.integer :status

      t.timestamps
    end
  end
end
