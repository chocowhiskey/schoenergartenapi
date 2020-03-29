class AddTitleToMonths < ActiveRecord::Migration[6.0]
  def change
    add_column :months, :title, :string
  end
end
