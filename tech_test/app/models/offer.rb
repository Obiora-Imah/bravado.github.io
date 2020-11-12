class Offer < ActiveRecord::Base
  belongs_to :company
  has_many :offer_departments
  has_many :departments, through: :offer_departments
  enum offer_type: %i[user_moderated, perfect_match, api]
end
