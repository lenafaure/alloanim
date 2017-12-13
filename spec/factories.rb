FactoryBot.define do
  factory :circonscription do
    name "MyString"
  end
  factory :user do
    id '1'
    email 'test@example.com'
    password 'f4k3p455w0rd'
    first_name 'John'
    last_name 'Doe'
    birthday '2000-01-01'
    phone_number '0678987654'
    soi_number '9876543'
    circonscription 'CASPE 6 14'
    diploma 'Bafa'

    # if needed
    # is_active true
  end
end