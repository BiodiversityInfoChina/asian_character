# encoding: utf-8
require_relative 'spec_helper'

describe AsianCharacter::Word do

  let(:word) {AsianCharacter::Word.new('二')}
  
  it 'initializes' do
    expect(word.class).to eq AsianCharacter::Word 
  end


  describe "#pinyin" do

    it 'returns pinyin' do
      file = File.join(File.dirname(__FILE__), 'files', 'pinyin_er4.xml')
      stub_request(:get, /GetWordPinyin\?/).
        to_return(body: File.read(file)) 
      expect(word.pinyin).to eq 'er4'
      expect(word.cache).to be_false
      expect(word.pinyin).to eq 'er4'
      expect(word.cache).to be_true
    end

  end

  describe "#sound_url" do

    it 'returns sound url' do
      file = File.join(File.dirname(__FILE__), 'files', 'sound_er4.xml')
      stub_request(:get, /GetWordPinyinSoundMP3\?/).
        to_return(body: File.read(file)) 
      expect(word.sound_url).
        to eq 'http://chinese.biodinfo.org/chinesefiles/soundci/4E8C.mp3'
      expect(word.cache).to be_false
      expect(word.sound_url).
        to eq 'http://chinese.biodinfo.org/chinesefiles/soundci/4E8C.mp3'
      expect(word.cache).to be_true
    end

  end

end
