#!/usr/bin/env ruby
# rubocop:disable Layout/LineLength

require 'rubygems'
require 'chatterbot/dsl'
require_relative '../lib/reply_handler'
require_relative '../lib/tweets_handler'

# this is the script for the twitter @petudeveloper
# generated on 2021-05-21 18:37:05 -0300

consumer_key 'put your info here'
consumer_secret 'put your info here'
secret 'put your info here'
token 'put your info here'

include TriviaPicker
include ReplyHandler

ilustrate_post_counter = 0

loop do
  replies do |tweet|
    if empty_help?(tweet)
      reply("#USER# this is a list of what petudeveloperBot can do for you \n - Talk about OpenSource.  \n - Motivate you. \n - Inspire you. \n - Ilustrate you.", tweet)
      favorite(tweet)

    elsif opensource?(tweet)
      opensource_quote_sorter
      reply("Open Source is awesome! #USER# #{@opensource_quote_num} #{@opensource_quote}", tweet)
      favorite(tweet)

    elsif motivate?(tweet)
      motivate_quote_sorter
      reply("#USER#! Never surrender: #{@motivate_quote_num} #{@motivate_quote}", tweet)
      favorite(tweet)

    elsif inspire?(tweet)
      inspire_quote_sorter
      reply("#{@inspire_quote_num} #{@inspire_quote} #USER# Don´t you love programming?", tweet)
      favorite(tweet)

    else
      reply(
        '#USER# the only important thing is that I am here to try to help you.', tweet
      )
    end
  end

  if ilustrate_post_counter == 720
    ilustrate_quote_sorter
    tweet("#{@ilustrate_quote_num} Did you know?: #{@ilustrate_quote}")
    ilustrate_post_counter = 0
  end
  sleep 60
  ilustrate_post_counter += 1
end
# rubocop:enable Layout/LineLength
