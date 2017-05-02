class MoviesController < ApplicationController
  @@api_url='http://www.omdbapi.com/?t='
  
  def index
    require('json')
    require('open-uri')
    movie_list=List.all
    
    @movie_info=[]
    
    movie_list.each do |k|
      temp_url=@@api_url+k.title
      info_page=open(temp_url)
      data=info_page.read
      @movie_info<<JSON.parse(data)
    end
    
  end

  def new
    title=params[:title]
    movie=List.new
    movie.title=title
    movie.save
    redirect_to '/'
  end

  def edit
  end

  def update
  end

  def delete
  end
end
