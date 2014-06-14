# encoding: utf-8

require 'spec_helper'

describe SimpleCov::Formatter::ShieldFormatter do

  before do
  	@formatter = SimpleCov::Formatter::ShieldFormatter.new
    
    allow(@formatter).to receive(:generate_shield)
    allow(@formatter).to receive(:coverage_percent).and_return(97)
  end

  describe '#format' do
    it 'should store the result' do
      expect(@formatter.instance_variable_get('@result')).to eq(@result)
    end

    it 'should generate the shield' do
      expect(@formatter).to receive(:generate_shield)

      @formatter.format(@result)
    end
  end

  describe '#generate_shield' do
    before do
      allow(@formatter).to receive(:generate_shield).and_call_original
    end

    it 'should open the shield file' do
      coverage_path = File.expand_path('../../coverage', __FILE__)

      expect(File).to receive(:open)
        .with("#{coverage_path}/coverage.svg", 'w')

      @formatter.generate_shield
    end

    it 'should call shields.io api' do
      response = double(HTTParty::Response)
      allow(response).to receive(:parsed_response)

      expect(HTTParty).to receive(:get)
        .with('http://img.shields.io/badge/coverage-97%25-brightgreen.svg')
        .and_return(response)

      @formatter.generate_shield
    end

    it 'should write the shield to the file' do
      shield = File.read("#{ASSETS_PATH}/coverage.svg")
      expect_any_instance_of(File).to receive(:write).with(shield)

      @formatter.generate_shield
    end
  end

  describe '#shield_url' do
    it 'should generate a green shield url' do
      allow(@formatter).to receive(:coverage_percent).and_return(99)
      expect(@formatter.shield_url).to eq('http://img.shields.io/badge/coverage-99%25-brightgreen.svg')
    end

    it 'should generate a yellow shield url' do
      allow(@formatter).to receive(:coverage_percent).and_return(85)
      expect(@formatter.shield_url).to eq('http://img.shields.io/badge/coverage-85%25-yellow.svg')
    end

    it 'should generate a red shield url' do
      allow(@formatter).to receive(:coverage_percent).and_return(68)
      expect(@formatter.shield_url).to eq('http://img.shields.io/badge/coverage-68%25-red.svg')
    end

    it 'should append flat style option when set' do
      allow(@formatter).to receive(:coverage_percent).and_return(99)

      SimpleCov::Formatter::ShieldFormatter.config[:style] = 'flat'
      expect(@formatter.shield_url).to eq('http://img.shields.io/badge/coverage-99%25-brightgreen.svg?style=flat')
    end

    it 'should not append invalid styles' do
      allow(@formatter).to receive(:coverage_percent).and_return(99)

      SimpleCov::Formatter::ShieldFormatter.config[:style] = 'fake'
      expect(@formatter.shield_url).to eq('http://img.shields.io/badge/coverage-99%25-brightgreen.svg')
    end
  end

  describe '#coverage_percent' do
    before do
      allow(@formatter).to receive(:coverage_percent).and_call_original

      @result = double(SimpleCov::Result)
      allow(@result).to receive(:covered_percent).and_return(97.3258)

      @formatter.format(@result)
    end

    it 'should generate coverage percent' do
      expect(@formatter.coverage_percent).to eq(97)
    end

    it 'should generate coverage with configured precision' do
      SimpleCov::Formatter::ShieldFormatter.config[:precision] = 2
      expect(@formatter.coverage_percent).to eq(97.33)
    end
  end

  describe '#config' do
    it 'should return config' do
      formatter = SimpleCov::Formatter::ShieldFormatter

      expect(formatter.config).to eq(formatter.instance_variable_get('@config'))
    end
  end
end

