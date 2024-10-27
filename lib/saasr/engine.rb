require 'rails'

require 'better_html'
require 'importmap-rails'
require 'turbo-rails'
require 'stimulus-rails'
require 'tailwindcss-rails'

module Saasr
  class Engine < Rails::Engine
    engine_name 'saasr'

    config.saasr = ActiveSupport::OrderedOptions.new

    config.after_initialize do |app|
      # :nocov:
      unless app.config.eager_load
        Saasr.config.base_controller_class.constantize
        Saasr.config.base_api_controller_class.constantize
        Saasr.config.base_metal_controller_class.constantize
        Saasr.config.base_job_class.constantize
        Saasr.config.base_mailer_class.constantize
        Saasr.config.base_record_class.constantize
      end
      # :nocov:
    end

    initializer 'saasr.config' do
      config.saasr.each { |key, value| Saasr.config.send(:"#{key}=", value) }
      Saasr.config.validate!
    end

    initializer 'saasr.inflections' do
      ActiveSupport::Inflector.inflections(:en) do |inflect|
        inflect.acronym 'API'
      end
    end

    initializer 'saasr.logger' do
      # :nocov:
      ActiveSupport.on_load(:saasr) do
        self.logger = ::Rails.logger if logger == Saasr::DEFAULT_LOGGER
      end
      # :nocov:

      Saasr::LogSubscriber.attach_to :saasr
    end

    initializer 'saasr.assets' do |app|
      app.config.assets.paths << root.join('app/javascript')
      app.config.assets.paths << root.join('vendor/javascript')
      app.config.assets.precompile += %w[saasr_manifest]
    end

    initializer 'saasr.importmap', before: 'importmap' do |app|
      app.config.importmap.cache_sweepers << root.join('app/javascript')
      app.config.importmap.cache_sweepers << root.join('vendor/javascript')
      app.config.importmap.paths << root.join('config/importmap.rb')
    end
  end
end
