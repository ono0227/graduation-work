class Potepan::SampleController < ApplicationController
  require 'httpclient'
  require 'json'
  def index
    utl = "https://presite-potepanec-task5.herokuapp.com/potepan/api/suggests"
    client = HTTPClient.new
    response = client.post(url)
    render json: JSON.parse(response.body)
  end

  def product_grid_left_sidebar
  end

  def product_list_left_sidebar
  end

  def single_product
  end

  def cart_page
  end

  def checkout_step_1
  end

  def checkout_step_2
  end

  def checkout_step_3
  end

  def checkout_complete
  end

  def blog_left_sidebar
  end

  def blog_right_sidebar
  end

  def blog_single_left_sidebar
  end

  def blog_single_right_sidebar
  end

  def about_us
  end

  def tokushoho
  end

  def privacy_policy
  end
end
