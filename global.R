library(tm)
library(SnowballC)
library(memoise)
library(rvest)
library(wordcloud)



# Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(body) {

  corpus = Corpus(VectorSource(body))
  corpus=tm_map(corpus, tolower)
  corpus=tm_map(corpus, PlainTextDocument)
  corpus=tm_map(corpus, removePunctuation)
  corpus=tm_map(corpus, removeWords, stopwords("english"))
  corpus=tm_map(corpus, stemDocument)
  dtm = TermDocumentMatrix(corpus,control=list(wordLengths=c(0,Inf)))
  spdtm<-removeSparseTerms(dtm, 0.95)
  
  m = as.matrix(spdtm)
  
  wordcloud<-sort(rowSums(m), decreasing = TRUE)
})