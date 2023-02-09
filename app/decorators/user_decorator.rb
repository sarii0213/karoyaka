class UserDecorator < Draper::Decorator
  delegate_all

  def img(size)
    return 'person-circle.svg' unless avatar.attached?

    command = case size
              when :thumb
                { resize_to_fill: [10, 10] }
              when :lg
                { resize_to_fill: [60, 60] }
              end

    image_url = command ? avatar.variant(command).processed : avatar
    h.rails_storage_proxy_url(image_url, only_path: true)
  end
end
