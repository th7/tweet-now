get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  begin
    Twitter.update(params[:tweet])
  rescue Twitter::Error => e
    p e
    return 'Tweet failed! -- ' + e.to_s
  end

  'Tweeted: ' + params[:tweet]
end