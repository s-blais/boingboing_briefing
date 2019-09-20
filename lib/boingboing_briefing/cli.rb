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
      puts " Enter one of the following:"
      sleep(0.75)
      puts " • the number of an article to read a teaser paragraph"
      puts "   and display URL to full article"
      sleep(0.75)
      puts " •\'list\' to see the list of articles again"
      sleep(0.75)
      puts " •\'exit\' to exit"
      puts ""
      input = gets.strip.downcase
      sleep(0.75)
      # if input.to_i > 0
      if (1..(@articles.size)).to_a.include?(input.to_i)
        the_article = @articles[input.to_i-1]
        # puts "-- #{the_article.title} --"
        puts " By #{the_article.author}"
        puts " #{the_article.teaser.gsub('(more…)','').strip}"
        puts " #{the_article.url}"
        puts ""
        # link_input = nil
        # while link_input == nil
        #   puts "Interesting enough to pursue further?"
        #   puts "Enter \"Y\" to open the full article in your browser.
        #   Enter \"N\" to continue"
        #   link_input = gets.strip.upcase
        #   if link_input == "Y"
        #     Launchy.open("#{the_article.url}")
        #   end
        # end
      elsif input == "list"
        list_articles
      elsif input == "exit"
        goodbye
      else
        puts ""
        sleep(0.5)
        puts " hmm, I don't understand that answer, sorry!"
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
