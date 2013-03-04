# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :share do
    vent nil
    user nil
    network "MyString"
    with "MyString"
  end
end
