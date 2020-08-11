require 'twitter'
require 'dotenv/load'
require 'json'
require 'uri'
require 'net/http'
require 'csv'
require 'fileutils'

module TwitterFollowersCount
  class Followers
    def initialize
      begin
        csv_data = CSV.read('./urls.csv')
      rescue StandardError => e
        puts e
        exit(1)
      end

      # If necessary, add keywords to use.
      domains = %w[twitter.com]

      dir_name = 'output'
      Dir.mkdir('./' + dir_name) unless Dir.exist?('./' + dir_name)

      base_file_name = 'followers.txt'
      str_today = Time.now.strftime('%Y%m%d%H%M%S')
      file_name = "#{str_today}_#{base_file_name}"

      File.open("./#{dir_name}/#{file_name}", 'w') do |file|
        csv_data.each do |data|
          puts "Start [#{data[0]}]"

          uri = URI.parse(data[0])
          account = uri.path.delete('/')

          unless uri.host =~ /#{domains.join('|')}/i
            file.write("\n")
            puts 'Skip'
            next
          end

          if uri.host =~ /#{domains[0]}/i
            followers = twitter_followers_count(account)
          elsif uri.host =~ /#{domains[1]}/i
            followers = sample_followers_count(account)
          end

          file.write("#{followers}\n")
          puts 'End'
        end
      end
      puts 'Finish'
    end

    private

    def twitter_followers_count(account)
      @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key    = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      end

      begin
        user = @client.user(account)
      rescue StandardError => e
        puts e
        exit(1)
      end
      user.followers_count
    end

    # If necessary, modify and use.
    def sample_followers_count(account)
      begin
        sample_uri = URI.parse('https://httpbin.org/json')
        json = Net::HTTP.get(sample_uri)
        result = JSON.parse(json)
      rescue StandardError => e
        puts e
        exit(1)
      end

      if result.empty?
        puts "User not found. [#{account}]"
        exit(1)
      end
      result['slideshow']['title']
    end
  end
end
