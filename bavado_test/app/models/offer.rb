class Offer < ActiveRecord::Base
  attr_accessor :label

  belongs_to :company
  has_many :offer_departments
  has_many :departments, through: :offer_departments

  scope :matched_with_users, -> (user_id) do
    joins(company: :users).where(users: { id: user_id })
  end

  scope :matched_with_departments,  -> (dept_ids) do
    includes(:departments).where(departments: {id: dept_ids})
  end

  scope :matched_with_company, -> (query) {
    where("companies.name like ?", "%#{query}%")
  }


  def self.match_offers(user_id, department_ids, query, sort_order = nil)
    pm = perfect_match(user_id, department_ids, query)
    gm = good_match(user_id, query)
    combined_ids = pm.ids | gm.ids
    oo = matched_with_users(user_id).where.not(id: combined_ids)
    oo = oo.order("price #{sort_order}") if sort_order
    pm = set_label(pm, "perfect_match")
    gm = set_label(gm, "good_match")
    oo = set_label(oo, "offer")
    pm | gm | oo
  end

  private

  def self.perfect_match(user_id, department_ids, query)
    matched_with_users(user_id)
    .matched_with_departments(department_ids)
    .matched_with_company(query)
  end

  def self.good_match(user_id, query)
    matched_with_users(user_id)
    .matched_with_company(query)
  end

  def self.set_label(data_set, type)
    data_set.each{|offer| offer.label = type}
  end
end
