require 'net/http'
require 'net/https'
require 'open-uri'
require 'fileutils'

module RocketFuel
  module Install
    class Download
      URL = 'https://codeload.github.com/LaunchAcademy/rocket-fuel-chef/tar.gz/master'

      def retrieve
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        resp = http.get(uri.request_uri)
        open(archive_path, "wb") do |file|
          file.write(resp.body)
        end
      end

      def extract
        FileUtils.mkdir_p(recipe_path)
        `tar xvfz #{archive_path} -C #{File.join(recipe_path, '..') }`
      end

      protected
      def archive_path
        RocketFuel::Install::ARCHIVE_PATH
      end

      def recipe_path
        RocketFuel::Install::RECIPE_PATH
      end

      def uri
        @uri = URI.parse(URL)
      end
    end
  end
end
