 require "sinatra"
 require "sinatra/reloader"
 require "sinatra/activerecord"
 set :database, { adapter: "sqlite3", database: "mydb.db" }
 require "./models/user"
 require "./models/team"


 get "/" do
  @users = User.all
  erb :user_list
 end

 get '/find' do
  erb :user_spec
 end

 post '/found' do
  @user=User.find_by(name: params[:name])
  @team=Team.find(@user.team_id)
  erb :user_found
 end

  get '/found/:name' do
  @user=User.find_by(name: params[:name])
  @team=Team.find(@user.team_id)
  erb :user_found
 end

  get '/what_team' do
   erb :team_spec
  end

post '/team_found' do
  @team =Team.find_by(name: params[:name])
  @users=User.where(team_id: @team.id)
  erb :team_found
 end

 get '/team_found/:name' do
  @team =Team.find_by(name: params[:name])
  @users=User.where(team_id: @team.id)
  erb :team_found

 end
