# AsianCharacter

This gem provides prononciation and pinyin transcription for Chinese characters 

## Installation

Add this line to your application's Gemfile:

    gem 'asian_character'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install asian_character

## Usage

    require 'asian_character'

    word = AsianCharacter::Word.new('谢谢')

    #to get pinyin transcription
    pinyin = word.pinyin #returns xie4xie4

    #to get a url to mp3 audio sound
    audio_url = word.sound_url

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
