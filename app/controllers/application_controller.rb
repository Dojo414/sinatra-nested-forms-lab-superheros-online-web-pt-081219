require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }
    
    get '/' do
      
      erb :super_hero
    end
    
    post '/teams' do 
      @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
      members = params[:team][:members]
      
      members.each do |super_hero_param|
        SuperHero.new({name: super_hero_param[:name], power: super_hero_param[:power], bio: super_hero_param[:bio]})
      end
      @super_heroes = SuperHero.all
      
      erb :team
    end


end
