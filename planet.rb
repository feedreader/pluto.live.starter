# encoding: utf-8


class Planet < Sinatra::Base

  #######################
  # Models
  
  include Pluto::Models   # e.g. Feed, Item, Site, etc.

  ###################
  # Helpers

  def feed_path( feed )
    "/feed/#{feed.key}"
  end

  def root_path()
    "/"
  end

  ##############################################
  # Controllers / Routing / Request Handlers

  get '/feed/:key' do |key|
    erb :feed, locals: { feed: Feed.find_by_key!( key ), site: find_planet_site }
  end

  get '/' do
    erb :index, locals: { site: find_planet_site }
  end

  #################
  # Utilities

  def find_planet_site
    site = Site.first      # FIX: for now assume one planet per DB (fix later; allow planet key or similar)
    if site.present?
      site
    else
      site = Site.new
      site.title = 'Planet Untitled'
    end
  end


end # class Planet
