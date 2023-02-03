class Room < ApplicationRecord
  require 'securerandom'
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  belongs_to :user
  def slug_candidates
    attempts = 0
    slug_length = 4
    slug = SecureRandom.alphanumeric(slug_length)

    while Room.where(slug:).exists?
      attempts += 1
      slug_length += 1 if attempts > 10
      attempts = 0
      slug = SecureRandom.alphanumeric(slug_length)
    end

    slug
  end
end
