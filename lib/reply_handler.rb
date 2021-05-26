require_relative 'text_matching'

module ReplyHandler
  def word_matcher(arr, tweet)
    arr.each do |i|
      return true if /\b#{i}\b/i.match?(tweet.text)
    end
    false
  end

  def empty_help?(tweet)
    raise ScriptError.new, 'Only Tweet-Object in #empty_help' if tweet.is_a?(Array)

    word_matcher(@help_source_matching, tweet)
  end

  def opensource?(tweet)
    raise ScriptError.new, 'Only Tweet-Object in #opensource' if tweet.is_a?(Array)

    word_matcher(@open_source_matching, tweet)
  end

  def motivate?(tweet)
    raise ScriptError.new, 'Only Tweet-Object in #motivate' if tweet.is_a?(Array)

    word_matcher(@motivate_source_matching, tweet)
  end

  def inspire?(tweet)
    raise ScriptError.new, 'Only Tweet-Object in #inspire' if tweet.is_a?(Array)

    word_matcher(@inspire_source_matching, tweet)
  end
end
