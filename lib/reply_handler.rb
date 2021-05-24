require_relative 'text_matching'

module ReplyHandler
  def empty_help?(tweet)
    raise ScriptError.new, 'Only Tweet-Object in #empty_help' if tweet.is_a?(Array)

    @help_source_matching.each do |i|
      return true if /\b#{i}\b/i.match?(tweet.text) || tweet.text == '@petudeveloper'
    end
    false
  end

  def opensource?(tweet)
    raise ScriptError.new, 'Only Tweet-Object in #opensource' if tweet.is_a?(Array)

    @open_source_matching.each do |i|
      return true if /\b#{i}\b/i.match?(tweet.text)
    end
    false
  end

  def motivate?(tweet)
    raise ScriptError.new, 'Only Tweet-Object in #motivate' if tweet.is_a?(Array)

    @motivate_source_matching.each do |i|
      return true if /\b#{i}\b/i.match?(tweet.text)
    end
    false
  end

  def inspire?(tweet)
    raise ScriptError.new, 'Only Tweet-Object in #inspire' if tweet.is_a?(Array)

    @inspire_source_matching.each do |i|
      return true if /\b#{i}\b/i.match?(tweet.text)
    end
    false
  end
end
