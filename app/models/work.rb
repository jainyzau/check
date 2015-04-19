class Work < ActiveRecord::Base
  has_many :work_records, dependent: :destroy
  belongs_to :user

  scope :belongs_to_user, ->(user_id){ where(user_id: user_id) }

  def checked?(date)
    not work_records.when(date).empty?
  end
end
