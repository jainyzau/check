class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :works
  has_many :work_records, through: :works
  has_one :score

  def checked_works(date = nil)
    date = Time.now unless date
    works.select { |w| w.checked?(date) }
  end

  def unchecked_works(date = nil)
    date = Time.now unless date
    works.select { |w| not w.checked?(date) }
  end

end
