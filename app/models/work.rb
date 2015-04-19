class Work < ActiveRecord::Base
    has_many :work_records
    belongs_to :user

  def checked?(date)
    not work_records.when(date).empty?
  end
end
