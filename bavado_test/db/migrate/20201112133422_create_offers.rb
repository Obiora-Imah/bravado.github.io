class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.decimal       :price
      t.references    :company, index: true

      t.timestamps
    end
  end
end
