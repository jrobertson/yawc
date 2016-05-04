#!/usr/bin/env ruby

# file: yawc.rb

# description: Yet Another Word Counter (YAWC) makes it convenient to 
#              count the number of words in a string and return the 
#              result as a hash object.

# note: A hashtag is identified as a word e.g. #liveblog

class Yawc

  attr_reader :to_h

  def initialize(s)

    h = words(s).split.group_by(&:to_s).\
        inject({}){|r, x| r.merge(String.new(x[0]).\
                                    force_encoding("utf-8") => x[-1].length)}
    @to_h = h.sort_by(&:last).reverse.to_h

  end

  def words(s)

    ignorewords = ['or', 'the', 'of', 'a', 'if', 'to', 'and', 
                    'in', 'is', 'are', 'as', 'it', 'at']

    s.downcase. 
      gsub(/\w+'\w+/,'').  # remove words containing an apostrophe
      gsub(/["']/,'').     # remove quotation marks
      gsub(/\W[^a-z|#]+(\w+)/,' \1 ').     # remove 
      #             non-alpabetical characters from start or beginning of words
      gsub(/\s.\s/,' ').                              # remove single digits 
      gsub(/\b(?:#{ignorewords.join('|')})\b/,'').   # ignore common words
      gsub(/\B[^\w#]\B+/,'')              # remove any other items which are 
      #                                 not words or hashtags
    
  end

end
