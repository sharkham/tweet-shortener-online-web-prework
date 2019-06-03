require 'pry'

def dictionary 
  dictionary_hash = { 
  "hello" => "hi",
  "to" => "2",
  "two" => "2",
  "too" => "2",
  "for" => "4",
  "four" => "4",
  "be" => "b",
  "you" => "u",
  "at" => "@",
  "and" => "&"
  }
end 

def word_substituter(tweet)
  #convert tweet into an array
  tweet_array = tweet.split(" ")

  #get arrays of dictionary keys and values
  keys_array = dictionary.keys 
  values_array = dictionary.values
  
  #new array to push new words into 
  new_tweet = []
  
  #compare each element of array to dictionary.keys (I think).
  #For each element of tweet_array, iterate through keys_array 
  #If they are the same, then change element of tweet_array 
  tweet_array.collect do |t|
    keys_array.each_with_index do |k, i|
      if t.downcase == k 
        t = values_array[i]
      end 
    end 
    new_tweet << t
  end 
  
  #convert tweet back into a string at the end of the method 
  newer_tweet = new_tweet.join(" ")
end 

def bulk_tweet_shortener(tweet_array)
  tweet_array.each do |tweet|
    puts word_substituter(tweet)
  end 
end 

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else 
    tweet 
  end 
end

def shortened_tweet_truncator(tweet)
  new_tweet = selective_tweet_shortener(tweet)
  if new_tweet > 140
    shorter_tweet = "#{new_tweet[0...135]} ..."
  else
    new_tweet
  end 
end 