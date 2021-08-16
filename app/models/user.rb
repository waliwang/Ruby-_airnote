class User < ApplicationRecord
    
    attr_accessor :password_confirmation

    vaildates :email, presence:  true
    vaildates :password, presence:  true
    vaildates :account, presence:  true
end
