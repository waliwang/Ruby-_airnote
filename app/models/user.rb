class User < ApplicationRecord
    
    attr_accessor :password_confirmation

    vaildates :email, presence:  true, uniqueness: true
    vaildates :password, presence:  true, confirmation: true
    vaildates :account, presence:  true, uniqueness: true

    before_create :encrypt_password

    

    private
    def encrypt_password(pw)
        salted_pw = "xyz #{self.password}827128#{self.password}82-12j23h"
        self.password = Digest::SHA1.hexdigest(salted_pw)
    end
end
