class ListsController < ApplicationController

  def index
    puts "作成したキー #{ENV['SECRET_KEY']}"
    @lists = List.all
  end

end
