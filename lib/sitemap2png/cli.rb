require "thor"
require 'net/http'
require 'xml-simple'

module Sitemap2png
  class Cli < Thor

    desc "load SITEMAP TARGET", "Load sitemap.xml and take screenshots"
    method_option :verbose, :aliases => "-v", :type => :boolean, :default => false
    def load(sitemap, target)
      basedir = File.dirname(File.dirname(__FILE__))
      webkit2png = "#{basedir}/vendor/webkit2png"

      # validate target
      raise Thor::Error, "Target directory does not exist!" unless Dir.exists?(target)

      xml_data = Net::HTTP.get_response(URI.parse(sitemap)).body
      # validate data
      raise Thor::Error, "Invalid xml!" if xml_data == ""


      # take shots
      # system "#{webkit2png} -F --dir=#{target} --width=#{} --filename=#{}"
    end

  end
end