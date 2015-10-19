FactoryGirl.define do  factory :text_scroll do
    text ""
text_color ""
bg_color ""
scroll_amount 1
  end

  factory :user do
    username "John"
    password "secret"
  end
end
