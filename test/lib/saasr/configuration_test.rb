require 'test_helper'

class Saasr::ConfigurationTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests

  setup do
    @model = Saasr::Configuration.new
  end

  test 'valid with defaults' do
    assert_nothing_raised { @model.validate! }
  end
end
