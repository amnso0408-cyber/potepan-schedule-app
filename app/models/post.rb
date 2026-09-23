class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :body, length: { maximum: 500 }
  validate :end_date_after_start_date

  def end_date_after_start_date
    if start_date.present? && end_date.present?
      if end_date < start_date
        errors.add(:end_date, "終了日は開始日以降にしてください")
      end
    end
  end
end