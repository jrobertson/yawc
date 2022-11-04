#!/usr/bin/env ruby

# file: yawc.rb

# description: Yet Another Word Counter (YAWC) makes it convenient to 
#              count the number of words in a string and return the 
#              result as a hash object.

# note: A hashtag is identified as a valid word e.g. #liveblog


# source: https://www.ranks.nl/stopwords
# see also: https://en.wikipedia.org/wiki/Stop_words

require 'words2dotdat'



class Yawc

  attr_reader :to_h
  
  # level:
  #    2 strips out ignore_words and stop_words
  #    3 strips out dictionary words

  def initialize(s, level: 2)
    
    @stopwords = Words2DotDat.stopwords
    
    a = case level
    when 2
      words(s).split
    when 3
      list = words(s).split
      list - Words2DotDat.words
    end
    
    h = a.group_by(&:to_s).\
        inject({}){|r, x| r.merge(String.new(x[0]).\
                                    force_encoding("utf-8") => x[-1].length)}
    @to_h = h.sort_by(&:last).reverse.to_h

  end

  def words(s)
    
    # words source:  http://norvig.com/mayzner.html
    
    ignorewords = ["the", "of", "and", "to", "in", "a", "is", "that", "for",
                   "it", "as", "was", "with", "be", "by", "on", "not", "he", 
                   "i", "this", "are", "or","his", "from", "at", "which", 
                   "but", "have", "an", "had", "they", "you", "were", 
                   "their", "one", "all", "we", "can", "her", "has", "there",
                   "been", "if", "more", "when", "will", "would", "who", 
                   "so", "no"]

    s.downcase. 
      gsub(/\w+'\w+/,'').  # remove words containing an apostrophe
      gsub(/["']/,'').     # remove quotation marks
      gsub(/\W[^a-z|#]*(\w+)/,' \1 ').     # remove 
      #             non-alpabetical characters from start or beginning of words
      gsub(/\s.\s/,' ').                              # remove single digits 
      gsub(/\b(?:#{(ignorewords + @stopwords).join('|')})\b/,'').   # ignore common words
      gsub(/\B[^\w#]\B+/,'')              # remove any other items which are 
      #                                 not words or hashtags
    
  end

end
