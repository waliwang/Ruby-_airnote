class SessionsController < ApplicationController
    def create
      pw = user_params[:password]
      salted_pw = "xyz #{self.password}827128#{self.password}82-12j23h"
      hashed_password = Digest::SHA1.hexdigest(salted_pw)



      user = User.find_by(email: user_params[:email],
                          password: hashed_password)

    if user
        #成功 －> 發session
        redirect_to "/"
    else
        redirect_to "/users/sign_in"
    end
end

private
def user_params
    params.require(:user).permit()

end
