if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'

  SimpleCov.start do
    load_profile 'test_frameworks'

    add_filter %r{^/config/}
    add_filter %r{^/db/}

    add_group 'Channels', 'app/channels'
    add_group 'Controllers', 'app/controllers'
    add_group 'Generators', 'lib/generators'
    add_group 'Helpers', 'app/helpers'
    add_group 'Jobs', 'app/jobs'
    add_group 'Libraries', %w[app/lib lib]
    add_group 'Mailers', 'app/mailers'
    add_group 'Models', 'app/models'
    add_group 'Tasks', 'lib/tasks'

    enable_coverage :branch
    primary_coverage :branch
  end
end

require 'saasr/version'
require 'saasr/engine'

require 'zeitwerk'

Zeitwerk::Loader.for_gem.tap do |loader|
  loader.inflector.inflect(
    'api' => 'API'
  )

  loader.ignore(
    "#{__dir__}/generators",
    "#{__dir__}/saasr/version.rb",
    "#{__dir__}/tasks"
  )
end.setup

module Saasr
  DEFAULT_LOGGER = ActiveSupport::Logger.new(nil)

  mattr_accessor :config, default: Configuration.new

  mattr_accessor :logger, default: DEFAULT_LOGGER

  def self.configure
    yield config
  end

  def instrument(channel, **, &)
    ActiveSupport::Notifications.instrument("#{channel}.saasr", **, &)
  end

  ActiveSupport.run_load_hooks(:saasr, self)
end
