# rubocop:disable Layout/LineLength

require_relative 'spec_helper'
require_relative '../lib/reply_handler'
require_relative '../lib/text_matching'

class Tweet
  attr_reader :text, :id

  def initialize(text, id)
    @text = text
    @id = id
  end
end

describe '#empty_help?' do
  include ReplyHandler
  before do
    @help_source_matching = ['help', 'what can you do', 'assistance', 'aid', 'support']
  end
  let(:tweet) { Tweet.new('help', 0o0000000001) }
  let(:tweet2) { Tweet.new('This is a test', 0o0000000001) }
  let(:arr) { [1, 2, 3] }
  it 'Should return True if the txt field of the Tweet object contain an string in the help_source_matching variable at the text_matching file' do
    expect(empty_help?(tweet)).to eql(true)
  end

  it 'Should return False if the txt field of the Tweet object does not contain an string in the help_source_matching variable at the text_matching file' do
    expect(empty_help?(tweet2)).to eql(false)
  end

  it 'Should raise ScriptError if argument is not a Tweet Object' do
    expect { empty_help?(arr) }.to raise_error(ScriptError)
  end
end

describe '#opensource?' do
  include ReplyHandler
  before do
    @help_source_matching = @open_source_matching = ['open source', 'opensource', 'free', 'Richard Stallman', 'RMS', 'non-proprietary', 'software',
                                                     'FOSS']
  end
  let(:tweet) { Tweet.new('Say something about opensource', 0o0000000001) }
  let(:tweet2) { Tweet.new('hello dude', 0o0000000001) }
  let(:arr) { [1, 2, 3] }
  it 'Should return True if the txt field of the Tweet object contain an string in the open_source_matching variable at the text_matching file' do
    expect(opensource?(tweet)).to eql(true)
  end

  it 'Should return False if the txt field of the Tweet object does not contain an string in the open_source_matching variable at the text_matching file' do
    expect(opensource?(tweet2)).to eql(false)
  end

  it 'Should raise ScriptError if argument is not a Tweet Object' do
    expect { opensource?(arr) }.to raise_error(ScriptError)
  end
end

describe '#motivate?' do
  include ReplyHandler
  before do
    @motivate_source_matching = %w[motivate sad encourage vitalize cheer positive negative actitud
                                   pressure unmotivated happy unfortunate lifeless]
  end
  let(:tweet) { Tweet.new('motivate me please', 0o0000000001) }
  let(:tweet2) { Tweet.new('hello dude', 0o0000000001) }
  let(:arr) { [1, 2, 3] }
  it 'Should return True if the txt field of the Tweet object contain an string in the motivate_source_matching variable at the text_matching file' do
    expect(motivate?(tweet)).to eql(true)
  end

  it 'Should return False if the txt field of the Tweet object does not contain an string in the motivate_source_matching variable at the text_matching file' do
    expect(motivate?(tweet2)).to eql(false)
  end

  it 'Should raise ScriptError if argument is not a Tweet Object' do
    expect { motivate?(arr) }.to raise_error(ScriptError)
  end
end

describe '#inspire?' do
  include ReplyHandler
  before do
    @inspire_source_matching = ['inspire', 'stimulate', 'persuade', 'energize', 'work', 'programming', 'hard work', 'lazy',
                                'work-shy', 'inactive', 'active', 'shiftless', 'indolent', 'spiritless', 'passive']
  end
  let(:tweet) { Tweet.new('I am feeling lazy, inspire me!', 0o0000000001) }
  let(:tweet2) { Tweet.new('hello dude', 0o0000000001) }
  let(:arr) { [1, 2, 3] }
  it 'Should return True if the txt field of the Tweet object does not contain an string in the inspire_source_matching variable at the text_matching file' do
    expect(inspire?(tweet)).to eql(true)
  end

  it 'Should return False if the txt field of the Tweet object does not contain an string in the inspire_source_matching variable at the text_matching file' do
    expect(inspire?(tweet2)).to eql(false)
  end

  it 'Should raise ScriptError if argument is not a Tweet Object' do
    expect { inspire?(arr) }.to raise_error(ScriptError)
  end
end

# rubocop:enable Layout/LineLength
