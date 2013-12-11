module AsianCharacter
  class Word
    attr_reader :cache

    def initialize(word)
      @word = word
      @cache = false
    end

    def pinyin
      if @pinyin
        @cache= true
        return @pinyin 
      end
      @cache = false
      url = 'http://chinese.biodinfo.org/'\
            'ChineseCharactorWebService.asmx/'\
            'GetWordPinyin?word=' + 
             URI.escape(@word) + '&psd=1'
      res = RestClient.get(url)
      res.gsub!(/\s/, ' ')
      res=res.match(%r|<string.*>([a-z0-9]+)</string>|)
      @pinyin = res ? res[1].strip : nil 
    end
    
    def sound_url
      if @sound_url
        @cache = true
        return @sound_url 
      end
      @cache = false
      url = 'http://chinese.biodinfo.org/'\
             'ChineseCharactorWebService.asmx/'\
             'GetWordPinyinSoundMP3?word=' + 
              URI.escape(@word) + '&psd=1'
      res = RestClient.get(url)
      res.gsub!(/\s/, ' ')
      res=res.match(%r|<string.*>\s*(.+)\s*</string>|)
      @sound_url = res ? res[1].strip : nil 
    end
  end
end
