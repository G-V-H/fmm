class PostsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_products, only: [:new, :create, :edit]
    before_action :set_user_post, only: [:edit, :update, :destroy]
    before_action :set_post, only: [:show]

    def index
        @posts = Post.all
    end

    def show
        @reviews = Review.all
        # session = Stripe::Checkout::Session.create(
        #     payment_method_types: ['card'],
        #     customer_email: current_user.email,
        #     line_items: [{
        #         name: @post.title,
        #         description: @post.description,
        #         amount: @post.deposit * 100,
        #         currency: 'aud',
        #         quantity: 1,
        #     }],
        #     payment_intent_data: {
        #         metadata: {
        #             user_id: current_user.id,
        #             post_id: @post.id
        #         }
        #     },
        #     success_url: "#{root_url}payments/success?userId=#{current_user.id}&postId=#{@post.id}",
        #     cancel_url: "#{root_url}posts"
        # )
    
        # @session_id = session.id
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.create(post_params)
        #@post = Post.create(post_params)
        if @post.errors.any?

            render "new"
        else 
            redirect_to posts_path
        end
    end

    def edit
        
    end


    def update
        @post = Post.update(params["id"], post_params)
        if @post.errors.any?

            render "edit"
        else 
            redirect_to posts_path
        end
    end

    def destroy
        Post.find(params[:id]).destroy
        redirect_to posts_path
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def set_products
        @products = Product.all
    end

    def set_user_post
        @post = current_user.posts.find_by_id(params[:id])

        if @post == nil
            redirect_to posts_path
        end
    end

    def post_params
        params.require(:post).permit(:product_id, :price_per_unit, :units_available, :city, :state, :picture)
    end


end