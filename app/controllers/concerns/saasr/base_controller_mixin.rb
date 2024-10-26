module Saasr::BaseControllerMixin
  extend ActiveSupport::Concern

  included do
    layout 'saasr/application'
  end
end
