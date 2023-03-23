# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  username               :string(255)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :avatar, blob: { content_type: %w[image/png image/jpg image/jpeg image/webp], size_range: 1..(5.megabytes) }

  has_many :items, dependent: :destroy
  has_many :to_let_go_items, dependent: :destroy
  has_many :done_letting_go_items, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorite_quotes, through: :favorites, source: :quote

  has_one_attached :avatar

  def favorite(quote)
    favorite_quotes << quote
  rescue ActiveRecord::RecordInvalid
    false
  end

  def unfavorite(quote)
    favorite_quotes.destroy(quote)
  end

  def favorite?(quote)
    favorite_quotes.include?(quote)
  end

  def category_ranking
    done_letting_go_items.joins(:category).group('categories.name').order(count_all: :desc).limit(3).count
  end

  def reason_ranking
    done_letting_go_items.joins(:reason).group('reasons.name').order(count_all: :desc).limit(3).count
  end

  def way_ranking
    done_letting_go_items.joins(:letting_go_way).group('letting_go_ways.name').order(count_all: :desc).limit(3).count
  end
end
