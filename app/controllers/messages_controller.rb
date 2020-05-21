class MessagesController < ApplicationController
    def create
        Message.create(user_id: current_user.id, post_id: params[:post_id], content: params[:text_field])
        redirect_to post_path(params[:post_id])
    end

    def destroy
        Message.find(params[:id]).destroy
        redirect_to dashboard_path
    end

end