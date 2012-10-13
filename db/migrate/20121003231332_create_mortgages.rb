class CreateMortgages < ActiveRecord::Migration
  def change
    create_table :mortgages do |t|
      t.float :principal
      t.float :annual_rate
      t.integer :term

      t.timestamps
    end
  end
end
