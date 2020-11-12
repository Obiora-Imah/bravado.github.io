class CreateOfferDepartments < ActiveRecord::Migration
  def change
    create_table :offer_departments do |t|
      t.integer :offer_id
      t.integer :department_id

      t.timestamps
    end
  end
end
