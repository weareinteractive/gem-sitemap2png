require "thor"
require "nokogiri"
require "net/http"

module Sitemap2png
  class Cli < Thor

    desc "load SITEMAP TARGET", "Load sitemap.xml and take screenshots"
    method_option :delay, :aliases => "-d", :type => :numeric, :default => 0
    def load(sitemap, target)
      basedir = File.dirname(File.dirname(File.dirname(__FILE__)))
      webkit2png = "#{basedir}/vendor/webkit2png"

      # validate target
      raise Thor::Error, "Target directory does not exist!" unless Dir.exists?(target)

      begin
        puts "Loading sitemap..."
        xml = Net::HTTP.get_response(URI.parse(sitemap)).body
      rescue Exception=>e
        raise Thor::Error, "Could not read sitemap!"
      end

      # validate data
      doc = Nokogiri::XML(xml)

      puts "Parsing pages..."
      doc.css('url > loc').each do |node|
        url = node.text
        name = File.basename(url, '.*')
        puts "Taking shots from: #{url}..."
        [640, 768, 1024, 1600].each do |width|
          system "#{webkit2png} #{url} --thumb --dir=#{target} --width=#{width} --filename=#{name}-#{width} --delay=#{options[:delay]}"
        end
      end
    end

  end
end