class UserDecorator < Draper::Decorator
  delegate_all

  def img(size)
    return 'person-circle.svg' unless avatar.attached?

    command = {
      thumb: { resize_to_fill: [10, 10] },
      lg: { resize_to_fill: [60, 60] },
      xl: { resize_to_fill: [100, 100] }
    }

    image_url = avatar.variant(command[size]).processed
    h.rails_storage_proxy_url(image_url, only_path: true)
  end

  def days
    items.distinct_days
  end

  def day_what
    if items.present? && items.last.created_at.day == Time.zone.now.day
      days
    else
      days + 1
    end
  end

  def random_quote
    favorite_quotes.sample
  end

  def to_let_go_items_total
    to_let_go_items.count
  end

  def done_letting_go_items_total
    done_letting_go_items.count
  end
end
