class ItemDecorator < Draper::Decorator
  delegate_all

  def img(size)
    unless image.attached?
      # category id: name
      # 1: 生活雑貨
      # 2: ファッション小物
      # 3: 美容グッズ
      # 4: 洋服・布類
      # 5: 紙類・書類
      # 6: 書籍・CD/DVD
      # 7: インテリア・電子機器
      # 8: キッチン小物・食
      # 9: スポーツ用品
      # 10: デジタルデータ
      default_image = case category.id
                      when 1
                        'spray.svg'
                      when 2
                        'hat.svg'
                      when 3
                        'lip_stick.svg'
                      when 4
                        'shirts.svg'
                      when 5
                        'docs.svg'
                      when 6
                        'book_cd.svg'
                      when 7
                        'side_table.svg'
                      when 8
                        'chopsticks.svg'
                      when 9
                        'racket.svg'
                      when 10
                        'pc.svg'
                      end
      return default_image
    end

    command = case size
              when :thumb
                { resize_to_fill: [100, 100] }
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
