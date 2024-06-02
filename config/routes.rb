Rails.application.routes.draw do
  #localhost:3000/posts
  #localhost:3000/postsにアクセスするとindexが表示される
  #localhost:3000/posts/newなど...?

  # CRUD操作が自動で作れるよ
  resources :posts, only: [:index, :new, :create, :edit, :destroy]
end
