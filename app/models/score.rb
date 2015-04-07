class Score < ActiveRecord::Base
    belongs_to :works
    belongs_to :users
end
