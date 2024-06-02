class PostsController < ApplicationController
    #loclahost:3000/posts/などのルーティングのコントローラーの割り当てを決めるらしい

    #indexコントローラー
    #indexにアクセスが来たときの処理
    def index
        @posts = Post.all
    end

    #新しい投稿インスタンス
    #@から始まる変数はerb(html)ファイルに挿入可能な変数である
    # newページ
    def new
        @post = Post.new
    end

    def create
        #新しい投稿
        @post = Post.new(post_params)

        #もしデータベースに保存されたら、リダイレクト
        if @post.save
            redirect_to posts_path
        #保存されなかったらそのままnewページをレンダリング
        else
            render :new
        end
    end

    def edit
        #編集する投稿をfindメソッドで見つけてくる
        #IDｈは一番上の投稿から連番で1~らしいよ
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        # もしpost_paramsで投稿を更新できた場合はpost_path(トップ)にリダイレクトだが、そうでなければ再び編集ページをレンダリング
        if @post.update(post_params)
            redirect_to posts_path
        else
            render :edit
        end
    end

    # private修飾子をつけることで、post_paramsはPostController内でしか呼び出せなくなる
    private

    def post_params
        # 投稿パラメータはpostテーブルのうち、titleとcontentのみであるということ
        params.require(:post).permit(:title, :content)
    end
end
