module Types
  class AuthProviderSignupData < Types::BaseInputObject
    argument :credentials, AuthProviderCredentialsInput, required: false
  end
end
