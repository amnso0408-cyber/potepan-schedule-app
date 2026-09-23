class PostsController < ApplicationController
  def index
  @posts = Post.all
  end

  def show
  @post = Post.find(params[:id])
  end

  def new
  @post = Post.new
  end

  def create
  @post = Post.new(post_params)
  if @post.save
    redirect_to posts_path, notice: "スケジュールを登録しました。"
  else
    flash[:alert] = "登録に失敗しました"
    render :new, status: :unprocessable_entity
  end
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
  if @post.update(post_params)
    redirect_to posts_path, notice: "スケジュールを更新しました"
  else
     flash[:alert] = "更新に失敗しました"
    render :edit, status: :unprocessable_entity
  end
end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path, notice: "削除しました", status: :see_other
    else
      redirect_to posts_path, alert: "削除に失敗しました"
  end
end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :start_date,
      :end_date,
      :body,
      :all_day
      )
    end
  end