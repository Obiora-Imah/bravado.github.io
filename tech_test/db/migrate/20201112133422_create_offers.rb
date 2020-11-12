class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.money       :price
      t.integer     :offer_type
      t.references  :company, index: true

      t.timestamps
    end
  end
end
