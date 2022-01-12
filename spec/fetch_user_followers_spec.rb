require 'rails_helper'

RSpec.describe Queries::FetchUserFollowers, type: :request do
  describe '.resolve' do
    it 'is successful' do
      connection = create(:connection)
      following = connection.following
      follower = connection.follower

      post '/graphql', params: { query: fetch_user_followers(follower.id) }

      json = JSON.parse(response.body)
      result = json['data']['fetchUserFollowers']

      expect(result).to include(
        'id' => be_present,
        'firstName' => following.first_name,
        'lastName' => following.last_name,
        'name' => following.name
      )
    end

    it 'fails if user doesnt exist' do
      random_id = "a&é'ç_fdkbf9786"

      expect do
        post '/graphql', params: { query: fetch_user_followers(random_id) }
      end.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end

  def fetch_user_followers(id)
    <<~GQL
      query {
        fetchUserFollowers(id: "#{id}"){
              id
              firstName
              lastName
              name
          }
      }
    GQL
  end
end
