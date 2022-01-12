module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    def resolve
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('User does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
