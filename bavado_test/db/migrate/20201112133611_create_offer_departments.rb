class CreateOfferDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :offer_departments do |t|
      t.integer :offer_id
      t.integer :department_id

      t.timestamps
    end
  end
end
