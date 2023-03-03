# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://karoyaka.site"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{Rails.application.credentials.dig(:aws, :s3, :bucket)}"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  Rails.application.credentials.dig(:aws, :s3, :bucket),
  aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
  aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
  aws_region: 'ap-northeast-1',
)
SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add about_path
  add privacy_path
  add term_path
  add mypage_account_path
  add signup_path
  add login_path
  add to_let_go_items_path
  add done_letting_go_items_path
  add quotes_path
  add achievement_path
end
