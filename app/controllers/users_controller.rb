class UsersController < ApplicationController
    def sign_up
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to
        else
        render html: params
        # 新增users
    end


    def profile
    end

    private
    def user_params
        params.require(:user).permit(:email, 
                                     :password, 
                                     :password_confirmation,
                                     :account)
end
