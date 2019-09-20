if I can read this from the clone, I don't have to manually delete the local copy of the repo, right?


user types boingboing-briefing to kick it off

Greet user and display numbered list of BB blog titles, with Author name
Ask if any sound interesting, request number of article, or exit to exit
  number -> return teaser (first <p>) of article if present
    Ask if they would like to visit the full article
      Y(open-in-browser?)
      N(returns to list)

each article (instance of class Article) should have title, author, teaser paragraph, and full-story url

BoingboingBriefing::Article
  @articles
