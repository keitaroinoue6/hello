class Book < ApplicationRecord

  enum sales_status: {
    reservation: 0, # 予約受付中
    now_on_sale: 1, # 発売中
    end_of_sales: 2, # 発売終了
  }


  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, ->(theme) { where("name like ?", "%#{theme}%") }

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  
  # 本の名前に"Dog"が含まれていたら"Dog Cute"という文字列に置き換えるコールバック
  before_validation :add_Cute_to_dog

  def add_Cute_to_dog
    # gsubメソッドはマッチした全ての部分を特定の文字列に置換します
    self.name = self.name.gsub(/Dog/) do |matched|
        "Dog Cute #{matched}"
    end
  end

  # Bookモデルを削除した際に削除されたデータの内容をログに書き込む処理が動作するようにするコールバック
  after_destroy do
    Rails.logger.info "Book is deleted: #{self.attributes}"
  end

  # 価格が5000円以下のBookモデルをdestroyした場合に、警告のログが吐き出されるようにするコールバック
  after_destroy :if => :high_price? do
    Rails.logger.warn "Book with high price is deleted: #{self.attributes}"
    Rails.logger.warn "価格が超えています！"
  end

  def high_price?
    price >= 5000
  end

end
