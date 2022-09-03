Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/update'
  # /books/:idというパターンにマッチするパスへアクセスした時にBooksコントローラーのshowアクションを実行する
  get "/books/:id" => "books#show"
  # 書籍情報を削除するアクション
  get "/books/:id" => "books#destroy"
  # scaffoldで作成するようなCRUD操作は下記の1行で済む
  resources :publishers
end
