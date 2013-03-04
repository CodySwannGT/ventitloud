# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vent do
    user nil
    text "MyText"
    public false
  end
end
