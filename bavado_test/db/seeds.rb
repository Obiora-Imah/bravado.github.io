# create companies
companies = JSON.parse(File.read "./db/companies.json")
companies.each{|c| Company.find_or_create_by(name: c)}

# create departments
departments = JSON.parse(File.read "./db/departments.json")
departments.each{|d| Department.find_or_create_by(name: d)}

# create users
users = JSON.parse(File.read "./db/users.json")
users.each do|u|
  User.find_or_create_by(name: u[0], company_id: Company.find_or_create_by(name: u[1]).id)
end

# create offer
offers = JSON.parse(File.read "./db/offers.json")
offers.each_with_index do |o,i|
  Offer.find_or_create_by(price: o, company_id: Company.find_or_create_by(name: companies[i]).id)
end

# create user_departments
user_departments = JSON.parse(File.read "./db/user_departments.json")
user_departments.each do|ud|
  UserDepartment.find_or_create_by(user_id: ud[0], department_id: ud[1])
end

# create offer_departments
offer_departments = JSON.parse(File.read "./db/offer_departments.json")
offer_departments.each do|ud|
  OfferDepartment.find_or_create_by(offer_id: ud[0], department_id: ud[1])
end

