module Saasr::BaseMailerMixin
  extend ActiveSupport::Concern

  included do
    prepend_view_path Saasr::Engine.root.join('app/views/mailers')
    layout 'saasr/mailer'
  end
end
