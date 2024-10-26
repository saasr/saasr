module Saasr::Configuration::Attributes
  extend ActiveSupport::Concern

  include ActiveModel::Attributes
  include ActiveModel::Dirty

  module ClassMethods
    def required_attribute(name, type = nil, **)
      attribute(name, type, **)

      validates! name, presence: true
    end
    alias required required_attribute
  end
end
