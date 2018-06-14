class RoomsController < ApplicationController
  #これは部屋の一覧を表示するためのアクションです
    def index
      @rooms = Room.all.order(created_at: :desc)
    end
  #これは部屋の詳細(= 部屋の一覧から特定の部屋を見るとき)に入るときに使います
    def show
      @room = Room.find_by(id: params[:id])
      @posts = @room.posts
    end
  #これは部屋そのものを作成するときに使います
    def create
      if request.post? then
        room = Room.new(room_params)
        room.save
        redirect_to("/rooms/#{room.id}/show")
      else
        flash[:notice] = "部屋の作成ができませんでした"
        redirect_to("/rooms/index")
      end

    end
  #これは部屋そのものを作成するときに使います  
    def new
      @room = Room.new
    end
  #これは部屋に関連づけられた投稿を新規で投稿するために使います
    def newpost
      if @post = Post.new(content: params[:content],room_id: params[:id])
        @post.save
        @room = Room.find(params[:id])
        redirect_to("/rooms/#{@room.id}/show")
      else
        flash[:notice] = 投稿に失敗しました
        redirect_to("/rooms/#{@room.id}/show")
      end
    end

    def login
      if @room = Room.find_by(name: params[:name],key: params[:key])
        session[:user_id] = @room.id
        redirect_to("/rooms/#{@room.id}/show")
      else
        flash[:notice] = "入室に失敗しました"
        redirect_to("/rooms/login")
      end
    end
  
    def login_form
      if @room = Room.find_by(id: params[:id])
      end
    end

    #直接ヘッダーからログインするためのメソッドです。
    def login_form1
    end
  
  
    
  private
  def room_params
    params.require(:room).permit(:name, :key)
  end
end