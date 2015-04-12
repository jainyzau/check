class User < ActiveRecord::Base
  has_many :works
  has_many :records, through: :works
  has_one :score

end
