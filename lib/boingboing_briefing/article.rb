class BoingboingBriefing::Article

  attr_accessor :title, :author, :teaser, :url

  def self.scrape_and_create
    articles = []
      doc = Nokogiri::HTML(open("https://boingboing.net/blog"))
      doc.css("article").each do |article|
        new_article = self.new
        new_article.title = article.css("h1").text
        new_article.author = article.css("p.byline a[rel='author']").text
        new_article.url = article.css("h1 a").attribute("href").value
        new_article.teaser = article.css("p:first-of-type").text
        articles << new_article
      end
    articles
  end

end
