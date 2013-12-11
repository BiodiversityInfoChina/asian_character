# encoding: utf-8
require_relative 'spec_helper'

describe "AsianCharacter" do
  it 'is a module' do
    expect(AsianCharacter.respond_to?(:initialize)).to be_false
  end
end

