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
      res = RestClient.get('http://chinese.biodinfo.org/'\
                           'ChineseCharactorWebService.asmx/'\
                           'GetWordPinyin?word=' + URI.escape(@word) + '&psd=1')
      res=res.match(/>([a-z0-9]+)<\/string>/m)
      @pinyin = res ? res[1].strip : nil 
    end
    
    def sound_url
      if @sound_url
        @cache = true
        return @sound_url 
      end
      @cache = false
      res = RestClient.get('http://chinese.biodinfo.org/'\
                           'ChineseCharactorWebService.asmx/'\
                           'GetWordPinyinMP3?word=' + 
                            URI.escape(@word) + '&psd=1')
      res=res.match(/>(.+)<\/string>/m)
      @sound_url = res ? res[1].strip : nil 
    end
  end
end
