require 'csv'
class AboutController < ApplicationController
  def index
    @about_info = []
    CSV.foreach('app/assets/data/about_info.csv', headers: true, header_converters: :symbol) do |data|
      @about_info << AboutInfo.new(data)
    end
  end
end
