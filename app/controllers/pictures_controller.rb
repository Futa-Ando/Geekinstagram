class PicturesController < ApplicationController
    before_action :authenticate_user!

    def index
      if params[:search] != nil && params[:search] != ''
        search = params[:search]
        @pictures = Picture.joins(:user).where("body LIKE ? OR title LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        @pictures = Picture.all.order(id: "DESC")
      end

      if params[:tag_ids]
        @pictures = []
        params[:tag_ids].each do |key, value|      
          @pictures += Tag.find_by(tag_name: key).pictures if value == "1"
        end
        @pictures.uniq!
      end

      if params[:tag]
        Tag.create(tag_name: params[:tag])
      end

        @picture = Picture.new
        @comment = Comment.new
    end

    def liked
        @liked_pictures = Picture.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        @liked_pictures = Kaminari.paginate_array(@liked_pictures).page(params[:page]).per(3)
        @picture = Picture.new
        @comment = Comment.new
    end

    def viewed
        @viewed_pictures = Picture.order(impressions_count: 'DESC')
        @viewed_pictures = @viewed_pictures.page(params[:page]).per(3)
        @picture = Picture.new
        @comment = Comment.new
    end

    def viewed
      @commented_pictures = Picture.find(Comment.group(:picture_id).order('count(picture_id) desc').pluck(:picture_id))
      @commented_pictures = @commented_pictures.page(params[:page]).per(3)
      @picture = Picture.new
      @comment = Comment.new
  end

    def create
        picture = Picture.new(picture_params)
        picture.user_id = current_user.id
        url = params[:picture][:youtube_url]
        url = url.last(11)
        picture.youtube_url = url
        if picture.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end

        if params[:picture][:tag_name].present?
          tag_list = params[:picture][:tag_name].split(nil)
          @picture.save_picture_tag(tag_list)
        end

      end

      def show
        @picture = Picture.find(params[:id])
        @comments = @picture.comments
        @comment = Comment.new
        impressionist(@picture, nil, unique: [:ip_address]) 
      end

      def edit
        @picture = Picture.find(params[:id])
      end

      def update
          picture = Picture.find(params[:id])
          if picture.update(picture_params)
            redirect_to :action => "show", :id => picture.id
          else
            redirect_to :action => "new"
          end
      end

      def destroy
        picture = Picture.find(params[:id])
        picture.destroy
        redirect_to action: :index
      end
    
      private
      def picture_params
        params.require(:picture).permit(:body,:image,:youtube_url,:level,:title,:video, tag_ids: [])
      end

end