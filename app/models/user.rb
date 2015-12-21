class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  before_save :default_role
  
  has_many :authentications, :dependent => :delete_all  
  has_many :posts
  has_many :comments
  has_many :favorite_posts
  has_many :favorites, through: :favorite_posts, source: :post

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  enum role: [:admin, :client, :guest]

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  def default_role
    self.role ||= 1 
  end

end