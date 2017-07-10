class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # write associations here
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
  if self.nausea > self.happiness
    return "sad"
  else
    return "happy"
  end
end


end
