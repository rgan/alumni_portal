FactoryGirl.define do
  factory :address do
    city "new york"
    country "usa"
  end

  factory :alumnus do
    first_name "f"
    last_name "l"
    ug_college "ug"
    pg_college "pg"
    specialty "surgery"
    email "foo@foo.com"
    address { Factory.build(:address) }
    admin false
  end

  factory :admin, :class => Alumnus do
    first_name "f"
    last_name "l"
    ug_college "ug"
    pg_college "pg"
    specialty "surgery"
    admin true
  end

end