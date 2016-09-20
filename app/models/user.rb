class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders

  def name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      "cher client"
    end
  end
end
