class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  require 'net/http'
end
