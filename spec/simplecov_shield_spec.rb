require 'spec_helper'

describe SimpleCov::Formatter::ShieldFormatter do

  before do
  	@formatter = SimpleCov::Formatter::ShieldFormatter.new

  	@result = double(SimpleCov::Result)
  	allow(@result).to receive(:covered_percent).and_return(97.3248)
  end

  describe '#shield_url' do
  	it 'should generate a shield url' do
  		pending 'wip: deciding best implementation'
  		@formatter.shield_url.should == 'http://img.shields.io/badge/coverage-97%-brightgreen.svg'
  	end
  end

	describe '#coverage_percent' do
  	it 'should generate the coverage percent' do
  		@formatter.coverage_percent(@result).should == 97
  	end
  end

  describe '#config' do
    it 'should return the config object' do
    	SimpleCov::Formatter::ShieldFormatter.config.should == SimpleCov::Formatter::ShieldFormatter.class_eval('@@config')
    end
  end
end

