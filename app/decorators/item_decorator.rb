class ItemDecorator < Draper::Decorator
  delegate_all

  def img(size = :origin)
    return 'dummy-100X100.png' unless image.attached?

    command = case size
              when :thumb
                { resize_to_fill: [100, 100] }
              when :lg
                { resize_to_fill: [200, 200] }
              else
                false
              end

    image_url = command ? image.variant(command).processed : image
    h.rails_storage_proxy_url(image_url, only_path: true)
  end

end
