class Job < Ohm::Model
  include Ohm::DataTypes

  attribute :image_ids, Type::Array
end
