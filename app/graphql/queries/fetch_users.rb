module Queries
  class FetchUsers < Queries::BaseQuery
    type [Types::UserType], null: false

    def resolve
      User.all.ordered
    end
  end
end
