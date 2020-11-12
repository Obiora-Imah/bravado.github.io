class User < ActiveRecord::Base
  belongs_to :company
  has_many :user_departments
  has_many :departments, through: :user_departments
end
