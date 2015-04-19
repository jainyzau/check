class WorkRecord < ActiveRecord::Base
  belongs_to :work

  scope :when, ->(date) { where('created_at >= ?', date.beginning_of_day).where('created_at <= ?', date.end_of_day)}
  scope :belongs_to_user, ->(user) { where(work_id: user.works.map {|w| w.id}) }
end
