class User < ActiveRecord::Base
  include BCrypt
  has_many :albums

  validates :name, :uniqueness => true
  validates :name, :password, :presence => true
  validates :password, :length => { :minimum => 5}

  before_create :hash_password


  def self.authenticate(name, password)
    user = User.find_by_name(name)
    return nil unless user
    db_password = Password.new(user.password)
    db_password == password ? user : nil  
  end

  private
  def hash_password
    self.password = Password.create(self.password)
  end
  
end
