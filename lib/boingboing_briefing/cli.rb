class BoingboingBriefing::CLI

  def call
    puts ""
    puts " BoingBoing – in brief!"
    puts ""
    sleep(1)
    list_articles
    present_list_options
  end

  def list_articles
    @articles = BoingboingBriefing::Article.scrape_and_create
    @articles.each.with_index(1) do |article, i|
      sleep(0.05)
      puts " #{i}. #{article.title}"
    end
    puts ""
  end

  def present_list_options
    input = nil
    while input != "exit"
      sleep(0.75)
      puts "   Enter one of the following:"
      puts " • the number of an article to read a teaser paragraph"
      puts "   and display URL to full article"
      puts " •\'list\' to see the list of articles again"
      puts " •\'exit\' to exit"
      puts ""
      input = gets.strip.downcase
      if (1..(@articles.size)).to_a.include?(input.to_i)
        the_article = @articles[input.to_i-1]
        puts " By #{the_article.author}"
        puts " #{the_article.teaser.gsub('(more…)','').strip}"
        puts ""
        puts " #{the_article.url}"
        puts ""
      elsif input == "list"
        list_articles
      elsif input == "exit"
        goodbye
      else
        sleep(0.5)
        puts ""
        puts " hmm, I don't understand that answer, sorry! Try again:"
        puts ""
      end
    end
  end

  def goodbye
    sleep(0.5)
    puts ""
    puts " Thank you, Boinger, til next time!"
    puts ""
  end

end
