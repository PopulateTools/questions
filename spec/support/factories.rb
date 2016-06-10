module Factories
  def create_user(attrs = {})
    attrs[:name]      ||= "John Donor"
    attrs[:username]  ||= attrs[:name].parameterize
    attrs[:email]     ||= "johndonor@example.com"
    attrs[:password]              ||= "wadusm4n"
    attrs[:password_confirmation] ||= attrs[:password]
    User.create!(attrs)
  end
end
