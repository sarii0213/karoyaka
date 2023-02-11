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
end
