FactoryGirl.define do
  factory :basic_post, class: Post do
    title 'Test Name basic'
    body  'Body'
  end

  factory :not_basic_post, class: Post do
    title 'Test Name'
    body  'Body basic'
  end

end
