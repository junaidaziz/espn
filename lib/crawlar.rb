require 'nokogiri'
require 'open-uri'
require 'csv'
require 'open_uri_redirections'

class Crawlar
  
  def initialize(site_url)
    @site_url = site_url
    @crawled_urls = []
    @doc = Nokogiri::HTML(open(@site_url))
  end
  
  
  def get_batting_card
    scorecard = []
    table = @doc.css("table.innings").first
    rows = table.css('tr')
    rows.each_with_index do |val, index|
      if index.odd?
        tds = val.css("td")
        card = []
        tds.each_with_index do |td_val, index|
          if index > 0
            card << td_val.text
          end
        end
        scorecard << card
      end
    end
    scorecard
  end

  def get_second_batting_card
    scorecard = []
    table = @doc.css("table.innings").last
    rows = table.css('tr')
    rows.each_with_index do |val, index|
      if index.odd?
        tds = val.css("td")
        card = []
        tds.each_with_index do |td_val, index|
          if index > 0
            card << td_val.text
          end
        end
        scorecard << card
      end
    end
    scorecard
  end

  def get_h1_list
    @doc = Nokogiri::HTML(open(@site_url))
    h1_headings = @doc.css("h1")
    (h1_headings.count > 0) ? self.get_heading_content(h1_headings) : ""
  end

  def get_h2_list
    @doc = Nokogiri::HTML(open(@site_url))
    h2_headings = @doc.css("h2")
    (h2_headings.count > 0) ? self.get_heading_content(h2_headings) : ""
  end

  def get_h3_list
    @doc = Nokogiri::HTML(open(@site_url))
    h3_headings = @doc.css("h3")
    (h3_headings.count > 0) ? self.get_heading_content(h3_headings) : ""
  end

  def get_heading_content(headings)
    content_array = []
    headings.each do |heading|
      content_array.push(heading.text)
    end
    content_array.collect(&:strip)
  end


  def set_url_array(web_links)
    urls = []
    web_links.each do |key,link|
      link = link.nil? ? " " : link
      urls.push(link) if uri?(link)
    end
    return urls
  end


# get difference between array and return uniq urls in both array
    
  def uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
    rescue URI::BadURIError
    false
    rescue URI::InvalidURIError
    false
  end
  
end