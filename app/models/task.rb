class Task < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates_presence_of :title, :status, :started_at
  validates :status, inclusion: { in: %w[doing done canceled] }

  scope :order_by_status, lambda {
    order("
      CASE
        WHEN status = 'doing' THEN '1'
        WHEN status = 'done' THEN '2'
        WHEN status = 'canceled' THEN '3'
      END")
  }
end
