class Work < ActiveRecord::Base
    has_many :records, class_name: "WorkRecord"
end
