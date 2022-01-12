module Queries
  class FetchUserFollowers < Queries::BaseQuery
    type [Types::UserType], null: false
    argument :id, ID, required: true

    def resolve(id:)
      User.find(id).followers.ordered
    end
  end
end
