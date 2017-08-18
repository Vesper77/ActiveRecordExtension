class ApplicationRecord < ActiveRecord::Base
  include ActiveRecordExtension
  self.abstract_class = true
end
