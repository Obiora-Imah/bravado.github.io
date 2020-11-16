class DepartmentSerializer
  include JSONAPI::Serializer
  attributes :id, :name
end
