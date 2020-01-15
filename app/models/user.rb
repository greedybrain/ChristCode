class User < ActiveRecord::Base
    has_secure_password

    validates_uniqueness_of :username, :email
    validates_presence_of :name, :username, :email, :password
    validates_length_of :password, :minimum => 8

    has_many :verses, through: :favorites 
    has_many :favorites

end