class OfferDepartment < ActiveRecord::Base
  belongs_to :offer
  belongs_to :department
end
