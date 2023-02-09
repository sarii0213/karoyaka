class ItemDecorator < Draper::Decorator
  delegate_all

  def img(size)
    return "category_#{category.id}.svg" unless image.attached?

    command = case size
              when :thumb
                { resize_to_fill: [90, 90] }
              when :lg
                { resize_to_fill: [200, 200] }
              end

    image_url = command ? image.variant(command).processed : image
    h.rails_storage_proxy_url(image_url, only_path: true)
  end

  def item_name
    name.presence || category.name
  end
end
