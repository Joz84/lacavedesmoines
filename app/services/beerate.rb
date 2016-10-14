require 'open-uri'

class Beerate < ServiceBase
  attr_accessor :beer_name

  def initialize(beer_name)
    @beer_name = beer_name
  end

  def run
    parsing_beerate(@beer_name)
  end

  private

  def parsing_beerate(beer_name)
    keyword = URI.encode(I18n.transliterate(beer_name))
    url = "https://www.ratebeer.com/findbeer.asp?beername=#{keyword}"
    html_file = open(url)
    html_doc = Nokogiri::HTML(html_file)
    str = html_doc.css('.table-striped tr:nth-child(2) td:nth-child(4)')
    str.text.to_f
  end
end







