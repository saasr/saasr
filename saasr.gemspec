version = File.read(File.expand_path('VERSION', __dir__)).strip

Gem::Specification.new do |spec|
  spec.name = 'saasr'
  spec.version = version
  spec.summary = 'Batteries-included SaaS framework for Rails.'
  spec.description = 'Build enterprise-ready SaaS applications without sacrificing the joy of Rails development.'

  spec.author = 'Tony Burns'
  spec.email = 'tony@tonyburns.net'
  spec.homepage = 'https://saasr.build'

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/saasr/saasr/issues',
    'changelog_uri' => "https://github.com/saasr/saasr/v#{version}/CHANGELOG.md",
    'documentation_uri' => "https://api.saasr.build/v#{version}/",
    'mailing_list_uri' => 'https://github.com/saasr/saasr/discussions',
    'source_code_uri' => "https://github.com/saasr/saasr/tree/v#{version}",
    'rubygems_mfa_required' => 'true'
  }

  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 3.2.0'
  spec.required_rubygems_version = '>= 1.8.11'

  spec.files = Dir['{app,config,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  spec.require_path = 'lib'

  spec.add_dependency 'actioncable', '>= 8.0.0.rc1'
  spec.add_dependency 'actionmailer', '>= 8.0.0.rc1'
  spec.add_dependency 'actionpack', '>= 8.0.0.rc1'
  spec.add_dependency 'activejob', '>= 8.0.0.rc1'
  spec.add_dependency 'activemodel', '>= 8.0.0.rc1'
  spec.add_dependency 'activerecord', '>= 8.0.0.rc1'
  spec.add_dependency 'activestorage', '>= 8.0.0.rc1'
  spec.add_dependency 'activesupport', '>= 8.0.0.rc1'
  spec.add_dependency 'bundler', '>= 1.15.0'
  spec.add_dependency 'railties', '>= 8.0.0.rc1'
  spec.add_dependency 'zeitwerk', '~> 2.6'

  spec.add_dependency 'better_html', '~> 2.1'
  spec.add_dependency 'importmap-rails', '~> 2.0'
  spec.add_dependency 'local_time', '~> 3.0'
  spec.add_dependency 'pg', '~> 1.1'
  spec.add_dependency 'stimulus-rails', '~> 1.3'
  spec.add_dependency 'tailwindcss-rails', '~> 3.0'
  spec.add_dependency 'turbo-rails', '~> 2.0'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
