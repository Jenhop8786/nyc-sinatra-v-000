class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
      end
      if !params[:title][:name].empty?
        @figure.titles << Title.find_or_create_by(params[:title])
      end
    @figure.save
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
      end
      if !params[:title][:name].empty?
        @figure.titles << Title.find_or_create_by(params[:title])
      end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end#FiguresController
