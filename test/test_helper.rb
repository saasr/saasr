ENV['RAILS_ENV'] = 'test'

require_relative '../test/dummy/config/environment'
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../test/dummy/db/migrate', __dir__)]
require 'rails/test_help'
require 'mocha/minitest'
require 'webmock/minitest'

if ActiveSupport::TestCase.respond_to?(:fixture_paths=)
  ActiveSupport::TestCase.fixture_paths = [File.expand_path('fixtures', __dir__)]
  ActionDispatch::IntegrationTest.fixture_paths = ActiveSupport::TestCase.fixture_paths
  ActiveSupport::TestCase.file_fixture_path = "#{File.expand_path('fixtures', __dir__)}/files"
  ActiveSupport::TestCase.fixtures :all
end

module ActiveSupport
  module Testing
    module TestsWithoutAssertions
      def after_teardown
        super

        return unless assertions.zero? && !skipped? && !error?

        file, line = method(name).source_location
        warn "Test is missing assertions: `#{name}` #{file}:#{line}" unless name.ends_with?('.erb')
      end
    end
  end
end

module ActiveSupport
  class TestCase
    include ActiveJob::TestHelper
    include FactoryBot::Syntax::Methods

    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    parallelize_setup do |worker|
      SimpleCov.command_name "#{SimpleCov.command_name}-#{worker}"
    end

    parallelize_teardown do |_worker|
      SimpleCov.result
    end

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    setup do
      ActionCable.server.pubsub.clear
      WebMock.disable_net_connect!(allow_localhost: true)
    end

    teardown do
      WebMock.reset!
    end
  end
end

module ActionDispatch
  class IntegrationTest < ActiveSupport::TestCase
    def parsed_cookies
      ActionDispatch::Cookies::CookieJar.build(request, cookies.to_hash)
    end

    def setup; end
  end
end
