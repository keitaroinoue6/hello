Rails.application.routes.draw do
  # /books/:idというパターンにマッチするパスへアクセスした時にBooksコントローラーのshowアクションを実行する
  get "/books/:id" => "books#show"
  # 書籍情報を削除するアクション
  delete "/books/:id" => "books#destroy"
  # scaffoldで作成するようなCRUD操作は下記の1行で済む
  resources :publishers
  # onlyを指定することで特定のルーティングのみを生成することができる
  resource :profile, only: [:show, :edit, :update]
end
