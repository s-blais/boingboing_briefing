
user types boingboing-briefing to kick it off (instantiates new instance of CLI class)

Greet user and display numbered list of BB blog article titles, with Author name
Ask if any sound interesting, request number of article, or list to list again, or exit to exit
  valid article number -> return author & teaser (first <p>) of article if present
    Ask if they would like to visit the full article
      Y(open-in-browser?) --- ugh, couldn't get Launcy to work
      N(returns to list)

each article (instance of class Article) should have title, author, teaser paragraph, and full-story url
