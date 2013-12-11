#!/usr/bin/env ruby

require 'sinatra'
require 'rest_client'
get '/' do 
  haml :home
end

post '/pinyin' do
  @chars = params[:characters]
  res = RestClient.get('http://chinese.biodinfo.org/ChineseCharactorWebService.asmx/GetWordPinyin?word=' + URI.escape(@chars) + '&psd=1')
  res=res.match(/>([a-z0-9]+)<\/string>/)
  @pinyin = res ? res[1] : nil 
  haml :pinyin
end

post '/audio' do
  @chars = params[:characters]
  res = RestClient.get('http://chinese.biodinfo.org/ChineseCharactorWebService.asmx/GetWordPinyinSoundMP3?word=' + URI.escape(@chars) + '&psd=1')
  res=res.match(/>(.+)<\/string>/)
  @audio = res ? res[1] : nil
  haml :audio
end
 
__END__

@@layout
!!!
%html
  %head
    %title
      just a try
  %body
    = yield
    %p this is footer

@@home 
%div pinyin
%form{ action: :pinyin, method: :post }
  %input{ type: 'text', id: 'characters', name: 'characters' }
  %input{ type: 'submit' }

%div Audio
%form{ action: :audio, method: :post }
  %input{ type: 'text', id: 'characters', name: 'characters' }
  %input{ type: 'submit' }
  
@@pinyin
%p 
  pinyin will be here:
  = @chars
%p pinyin: #{@pinyin}

@@audio
%p 
  Audio will be here:
  =@chars
%audio{controls: true}
  %source{src: @audio}
