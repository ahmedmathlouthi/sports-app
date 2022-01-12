require 'rails_helper'

RSpec.describe Queries::FetchUsers, type: :request do
  describe '.resolve' do
    it 'is successful' do
      user = create(:user)

      post '/graphql', params: { query: valid_fetch_users_query }

      json = JSON.parse(response.body)
      result = json['data']['fetchUsers']

      expect(result).to include(
        'id' => be_present,
        'firstName' => user.first_name,
        'lastName' => user.last_name,
        'name' => user.name
      )
    end
  end

  def valid_fetch_users_query
    <<~GQL
      query {
          fetchUsers{
              id
              firstName
              lastName
              name
          }
      }
    GQL
  end
end
