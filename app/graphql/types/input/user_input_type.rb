module Types
  module Input
    class UserInputType < Types::BaseInputObject
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :name, String, required: true
    end
  end
end
