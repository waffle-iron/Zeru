# == Schema Information
#
# Table name: memoids
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

Fabricator( :memoid) do
  content { Faker::Lorem.paragraph }
  user    { Fabricate :user, email: Faker::Internet.email }
end

Fabricator(:ripe_memoid, from: :memoid) do
  release_dates {[ReleaseDate.new(delivery_date: Date.today)]}
end
