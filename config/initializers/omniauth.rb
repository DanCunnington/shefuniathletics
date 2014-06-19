OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '509336795860535', 'cd8392852cfe9de562dbf34699e7e88f',
  {:client_options => {:ssl => {:verify => false}}}
end