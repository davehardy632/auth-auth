class User < ApplicationRecord

  def self.authenticate(email, password)
    user = User.find_by(email_address: email)
    if user == nil
      return nil
    elsif user.password == password
      return user
    end
  end
end
