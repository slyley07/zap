FactoryGirl.define do
  factory :user do
    email "megan@gmail.com"
		username "megawoman"
		fname "Megan"
		lname "Flahive"
		password "goodpassword"
		password_confirmation "goodpassword"
		pnumber "555-555-5555"
		city "Indianapolis"
		gender "Female"
		birthday "2015-05-29 12:04:30"
		website "www.megawoman.com"
  end

end
