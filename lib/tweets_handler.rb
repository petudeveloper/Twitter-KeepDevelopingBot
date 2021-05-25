require_relative 'trivia_info'

module TriviaPicker
  
  private
  
  def opensource_quote_sorter(hash = @opensource_hash)
    raise ScriptError.new, 'Only hashes in opensource_quote_sorter' unless hash.is_a?(Hash)

    if hash.empty?
      @opensource_hash = @opensource_history
      @opensource_history = {}
    end

    @opensource_quote = hash.values.to_a.sample
    @opensource_quote_num = hash.key(@opensource_quote)
    opensource_quote_block = { @opensource_quote_num => @opensource_quote }
    @opensource_history.merge!(opensource_quote_block)
    @opensource_hash.delete(@opensource_quote_num)
  end

  def motivate_quote_sorter(hash = @motivate_hash)
    raise ScriptError.new, 'Only hashes in motivate_quote_sorter' unless hash.is_a?(Hash)

    if hash.empty?
      @motivate_hash = @motivate_history
      @motivate_history = {}
    end

    @motivate_quote = hash.values.to_a.sample
    @motivate_quote_num = hash.key(@motivate_quote)
    motivate_quote_block = { @motivate_quote_num => @motivate_quote }
    @motivate_history.merge!(motivate_quote_block)
    @motivate_hash.delete(@motivate_quote_num)
  end

  def inspire_quote_sorter(hash = @inspire_hash)
    raise ScriptError.new, 'Only hashes in inspire_quote_sorter' unless hash.is_a?(Hash)

    if hash.empty?
      @inspire_hash = @inspire_history
      @inspire_history = {}
    end

    @inspire_quote = hash.values.to_a.sample
    @inspire_quote_num = hash.key(@inspire_quote)
    inspire_quote_block = { @inspire_quote_num => @inspire_quote }
    @inspire_history.merge!(inspire_quote_block)
    @inspire_hash.delete(@inspire_quote_num)
  end

  def ilustrate_quote_sorter(hash = @ilustrate_hash)
    raise ScriptError.new, 'Only hashes in ilustrate_quote_sorter' unless hash.is_a?(Hash)

    if hash.empty?
      @ilustrate_hash = @ilustrate_history
      @inspire_history = {}
    end
    @ilustrate_quote = hash.values.to_a.sample
    @ilustrate_quote_num = hash.key(@ilustrate_quote)
    ilustrate_quote_block = { @ilustrate_quote_num => @ilustrate_quote }
    @ilustrate_history.merge!(ilustrate_quote_block)
    @ilustrate_hash.delete(@ilustrate_quote_num)
  end
end
