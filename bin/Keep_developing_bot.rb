#!/usr/bin/env ruby

require 'rubygems'
require 'chatterbot/dsl'
require 'dotenv/load'
require_relative '../lib/reply_handler'
require_relative '../lib/tweets_handler'

# this is the script for the twitter @petudeveloper
# generated on 2021-05-21 18:37:05 -0300

consumer_key ENV['KEY1']
consumer_secret ENV['KEY2']
secret ENV['KEY3']
token ENV['KEY4']

ilustrate_post_counter = 0

loop do
  include TriviaPicker
  include ReplyHandler
  replies do |tweet|
    if empty_help?(tweet)
      reply("#USER# We can talk about \n -OpenSource. \n -Motivate you. \n -Inspire you. \n -Ilustrate you.", tweet)
      favorite(tweet)

    elsif opensource?(tweet)
      opensource_quote_sorter
      reply("Open Source is awesome! #USER# #{@opensource_quote_num} #{@opensource_quote}", tweet)
      favorite(tweet)

    elsif motivate?(tweet)
      motivate_quote_sorter
      reply("#USER# Never surrender!: #{@motivate_quote_num} #{@motivate_quote}", tweet)
      favorite(tweet)

    elsif inspire?(tweet)
      inspire_quote_sorter
      reply("#{@inspire_quote_num} #{@inspire_quote} #USER# Don´t you love programming?", tweet)
      favorite(tweet)

    else
      reply('#USER# the only important thing is that I am here to try to help you.', tweet)
    end
  end
  sleep 15
end

loop do
  if ilustrate_post_counter == 1440
    ilustrate_quote_sorter
    tweet("#{@ilustrate_quote_num} Did you know?: #{@ilustrate_quote}")
    ilustrate_post_counter = 0
  end
  sleep 15
  ilustrate_post_counter += 1
end
