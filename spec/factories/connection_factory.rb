FactoryBot.define do
  factory :connection do
    follower { create(:user) }
    following { create(:user) }
  end
end
