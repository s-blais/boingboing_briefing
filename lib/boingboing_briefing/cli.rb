class BoingboingBriefing::CLI

  def call
    puts ""
    puts "BoingBoing – in brief!"
    puts ""
    list_articles
    present_list_options
  end

  def list_articles
    puts "ordered list of articles from first page of boingboing.net/blog goes here"
    puts ""
  end

  def present_list_options
    puts "Enter the number of an article that sounds interesting to you to read a teaser paragraph, or \'exit\' to exit"
    puts ""
  end

end
