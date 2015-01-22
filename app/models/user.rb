class User < ActiveRecord::Base
	ROLES = %w[patient doctor]
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

	acts_as_birthday :date_of_birth

	has_many :allergies
	has_many :medications
  has_many :permissions
	has_many :statuses
	has_many :fitnesses
	has_many :goals
	has_many :pictures
	has_many :weights
	has_many :episodes
	has_many :heights
	has_many :pages, through: :diagnoses
	has_many :diagnoses
	has_many :albums

	has_many :handshakes, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :handshakes, source: :followed
	has_many :reverse_handshakes, foreign_key: "followed_id", class_name: "Handshake", dependent: :destroy
	has_many :followers, through: :reverse_handshakes, source: :follower

  has_many :conditions
	has_many :exercises

	has_many :user_friendships
  
  has_many :friends, through: -> { where(user_friendships: { state: "accepted"}) }, :through => :user_friendships
  
  has_many :pending_user_friendships, class_name: 'UserFriendship', foreign_key: :user_id, through: -> { where(user_friendships: { state: "pending"}) }, :through => :user_friendships
  has_many :pending_friends, through: :pending_user_friendships, source: :friend
  
  has_many :requested_user_friendships, class_name: 'UserFriendship', foreign_key: :user_id, through: -> { where(user_friendships: { state: "requested"}) }, :through => :user_friendships
  has_many :requested_friends, through: :requested_user_friendships, source: :friend
  
  has_many :blocked_user_friendships, class_name: 'UserFriendship', foreign_key: :user_id, through: -> { where(user_friendships: { state: "blocked"}) }, :through => :user_friendships
  has_many :blocked_friends, through: :blocked_user_friendships, source: :friend
  
  has_many :accepted_user_friendships, class_name: 'UserFriendship', foreign_key: :user_id, through: -> { where(user_friendships: { state: "accepted"}) }, :through => :user_friendships
  has_many :accepted_friends, through: :accepted_user_friendships, source: :friend

	has_attached_file :avatar, styles: {
    		large: "800x800>", medium: "300x200>", small: "260x180>", thumb: "80x80#"
  	}

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :date_of_birth, presence: true
	validates :email, presence: true

	def full_name
		first_name + " " + last_name
	end

	def handshake!(other_user)
		handshakes.create!(followed_id: other_user.id)
	end

	def following?(other_user)
		handshakes.find_by_followed_id(other_user.id)
	end

	def find_handshake(other_user)
  		handshakes.find_by_followed_id(other_user.id)
  	end

	def gravatar_url
		stripped_email = email.strip
		downcased_email = stripped_email.downcase
		hash = Digest::MD5.hexdigest(downcased_email)

		"http://gravatar.com/avatar/#{hash}"
	end

	def has_blocked?(other_user)
		blocked_friends.include?(other_user)
	end

	private
		def create_remember_token
     	 	self.remember_token = SecureRandom.urlsafe_base64
   		 end
end
