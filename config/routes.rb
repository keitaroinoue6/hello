Rails.application.routes.draw do
  # /books/:idというパターンにマッチするパスへアクセスした時にBooksコントローラーのshowアクションを実行する
  get "/books/:id" => "books#show"
end
