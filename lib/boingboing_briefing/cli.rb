class BoingboingBriefing::CLI

  def call
    puts ""
    puts "BoingBoing – in brief!"
    puts ""
    list_articles
    present_list_options
    goodbye
  end

  def list_articles
    @articles = BoingboingBriefing::Article.scrape_and_create
    @articles.each.with_index(1) do |article, i|
      puts "#{i}. #{article.title}"
    end
  end

  def present_list_options
    input = nil
    while input != "exit"
      puts "Enter one of the following:\n
      • The number of an article that sounds interesting to you to read a teaser paragraph
      •\'list\' to see the list of articles again
      •\'exit\' to exit"
      puts ""
      input = gets.strip.downcase
      if input.to_i > 0
        the_article = @articles[input.to_i-1]
        puts "#{the_article.title} – #{the_article.author}"
      elsif input == "list"
        list_articles
      else "hmm, I don't understand that answer, sorry!"
      end
    end
  end

  def goodbye
    puts "Thank you, Boinger, til next time!"
  end

end
