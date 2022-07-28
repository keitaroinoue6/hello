class Book < ApplicationRecord
  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, ->(theme) { where("name like ?", "%#{theme}%") }

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  before_validation :add_Cute_to_dog

  def add_Cute_to_dog
    self.name = self.name.gsub(/Dog/) do |matched|
        "Dog Cute #{matched}"
    end
  end
end
