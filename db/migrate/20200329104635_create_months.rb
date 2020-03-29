class CreateMonths < ActiveRecord::Migration[6.0]
  def change
    create_table :months do |t|
      t.text :description

      t.timestamps
    end
  end
end
