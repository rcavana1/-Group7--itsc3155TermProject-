OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '848347013447-nf9tssn9vqv7mn0v3p2vh4j0t6giqc58.apps.googleusercontent.com', 'zYK-IPU24oOCIGaCPmkyQ9ez', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end