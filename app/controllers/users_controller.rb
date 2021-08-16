class UsersController < ApplicationController
    def sign_up
        @user = User.new
    end

    def create
        render html: params
    end


    def profile
    end
end
