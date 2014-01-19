require "thor"
require "nokogiri"
require "net/http"
require 'fileutils'

module Sitemap2png
  class Cli < Thor

    desc "load SITEMAP PATH WITH", "Load sitemap.xml & save screenshots"
    method_option :with, :aliases => "-w", :type => :numeric, :default => 1024
    method_option :delay, :aliases => "-d", :type => :numeric, :default => 0
    def load(sitemap, path)
      @basedir = File.dirname(File.dirname(File.dirname(__FILE__)))
      @webkit2png = "#{@basedir}/vendor/webkit2png"

      # validate path
      FileUtils.mkdir_p(path) unless Dir.exists?(path)

      load_sitemap(sitemap, path, options[:width], options[:delay])

    end

    no_tasks do

      def load_sitemap(sitemap, path, width, delay)
        begin
          puts "Loading sitemap #{sitemap}"
          xml = Net::HTTP.get_response(URI.parse(sitemap)).body
        rescue Exception => error
          raise Thor::Error, "Could not read sitemap!"
        end

        # validate data
        doc = Nokogiri::XML(xml)

        doc.css('url > loc').each do |node|
          url = node.text
          name = File.basename(url, '.*')
          puts "Taking shots from: #{url}"
          system "#{@webkit2png} #{url} --thumb --dir=#{path} --width=#{width} --filename=#{name}-#{width} --delay=#{delay}"
        end

        doc.css('sitemap > loc').each do |node|
          load_sitemap(node.text, path, width, delay)
        end

      end

    end

  end
end