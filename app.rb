require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])

      # @ship = Ship.new(params[:ship][:name], params[:ship][:type], params[:ship][:booty])
      params[:pirate][:ships].each do |details|
        Ship.new(details["name"], details["type"], details["booty"])
        # Ship.new(details[:name], details[:type], details[:booty])
        # Ship.new(details.name, details.type, details.booty)
      end
      # binding.pry
      @classes = Ship.all

      erb :'pirates/show'
    end
  end
end
