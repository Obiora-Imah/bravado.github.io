class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string     :name
      t.string     :logo
      t.string     :info_url

      t.timestamps
    end
  end
end
