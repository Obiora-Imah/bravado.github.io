class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string     :name
      t.string     :logo
      t.string     :info_url

      t.timestamps
    end
  end
end
