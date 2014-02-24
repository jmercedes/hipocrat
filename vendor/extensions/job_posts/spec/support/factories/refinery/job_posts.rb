
FactoryGirl.define do
  factory :job_post, :class => Refinery::JobPosts::JobPost do
    sequence(:position) { |n| "refinery#{n}" }
  end
end

