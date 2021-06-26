class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :content, presence: true
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
  # was_attached?メソッドは、self.image.attached?という記述によって、
  # 画像があればtrue、なければfalseを返す仕組みです。
  # これにより、画像が存在しなければテキストが必要となり、
  # 画像があればテキストは不要になりました。
end
