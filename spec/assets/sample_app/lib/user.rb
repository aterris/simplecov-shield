# encoding: utf-8

module User
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def initials
    "#{@first_name[0]}.#{@last_name[0]}."
  end

end