class FavoritesController < ApplicationController
	def index
		@favorite_topics = current_user.favorite_topics
	end
	def create
		favorite = Favorite.new
		favorite.user_id = current_user.id
		favorite.topic_id = params[:topic_id]
		if favorite.save
			redirect_to topics_path, success: 'お気に入りに登録しました'
		else
			redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
		end
	end
	def destroy
		@favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
		@favorite.destroy
		redirect_to topics_path, success: 'お気に入りを取り消しました'
	end
	def show
		@favorite = favorite.find_by(id:params[:id])
		@user = @favorite.user
		# rails 07 いいね数表示の課題
		@favorites_count = Favorite.where(post_id: @post.id).count
	end
end