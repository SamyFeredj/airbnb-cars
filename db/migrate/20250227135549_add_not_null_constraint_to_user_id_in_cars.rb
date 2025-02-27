class AddNotNullConstraintToUserIdInCars < ActiveRecord::Migration[7.1]
  def up
    # Assigner un user par défaut aux voitures existantes avant d'appliquer NOT NULL
    default_user = User.first || User.create!(email: "default@example.com", password: "password", role: "renter")

    Car.where(user_id: nil).update_all(user_id: default_user.id)

    # Appliquer la contrainte NOT NULL une fois la colonne remplie
    change_column_null :cars, :user_id, false
  end

  def down
    change_column_null :cars, :user_id, true
  end
end
