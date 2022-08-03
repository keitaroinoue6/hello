Rails.application.routes.draw do
  # /books/:idというパターンにマッチするパスへアクセスした時にBooksコントローラーのshowアクションを実行する
  get "/books/:id" => "books#show"
  # 書籍情報を削除するアクション
  get "/books/:id" => "books#destroy"
end
