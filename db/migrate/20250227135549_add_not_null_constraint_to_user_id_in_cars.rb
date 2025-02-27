class AddNotNullConstraintToUserIdInCars < ActiveRecord::Migration[7.1]
  def change
    change_column_null :cars, :user_id, false
  end
end
