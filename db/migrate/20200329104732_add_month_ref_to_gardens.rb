class AddMonthRefToGardens < ActiveRecord::Migration[6.0]
  def change
    add_reference :gardens, :month, foreign_key: :true
  end
end
