require_relative 'lib/saasr/version'

Gem::Specification.new do |spec|
  spec.name        = 'saasr'
  spec.version     = Saasr::VERSION
  spec.authors     = ['Tony Burns']
  spec.email       = ['tony@tonyburns.net']
  spec.homepage    = 'TODO'
  spec.summary     = 'TODO: Summary of Saasr.'
  spec.description = 'TODO: Description of Saasr.'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = "TODO: Put your gem's public repo URL here."
  spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.required_ruby_version = '>= 3.2.0'
  spec.required_rubygems_version = '>= 1.8.11'

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
