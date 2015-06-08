class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	
	# has_secure_password

	validates_presence_of :email, :password, :password_confirmation

	validates_uniqueness_of :email, :username, case_sensitive: :false

	# validates :password, confirmation: true

	validates :password, presence: true, on: :create



	# validates :password_confirmation, presence: true, on: :create

	# validates :username, format: { with: /\A\w+\z/, message: "only letters, numbers, and underscores allowed!"}
end
