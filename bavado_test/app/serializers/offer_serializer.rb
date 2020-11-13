class OfferSerializer
  include JSONAPI::Serializer
  attributes :id, :price, :label

  attribute :company do|offer|
    offer.company.name
  end
  has_many :departments
end
