require 'sinatra'
require 'httparty'
require 'json'

get '/anonymize' do
  postback(params[:text], params[:channel_id])
end

def postback(message, channel)
  slack_webhook = ENV['SLACK_WEBHOOK_URL']
  HTTParty.post(slack_webhook,
                body: { 'text' => message,
                        'username' => 'John Doe',
                        'channel' => channel }.to_json,
                headers: { 'content-type' => 'application/json' })
end
