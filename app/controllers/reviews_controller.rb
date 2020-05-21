class ReviewsController < ApplicationController

    def create
        Review.create(user_id: current_user.id, post_id: params[:post_id], comment: params[:text_field])
        redirect_to post_path(params[:post_id])
    end

    def destroy

    end

end
