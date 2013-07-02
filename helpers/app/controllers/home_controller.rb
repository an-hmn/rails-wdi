class HomeController < ApplicationController
  def home
  end

  def numbers
    @amount = 234
    @large_number = 347
    @phone = 2125551212
  end

  def text
    @numbers = (1..20).to_a
    @person_count1 = 1
    @person_count2 = 2
    @story = "A very long long time ago in a place far, far away..."
  end

  def assets
  end

  def url
  end
end
