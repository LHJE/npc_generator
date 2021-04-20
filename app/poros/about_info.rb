class AboutInfo
  attr_reader :name,
              :bio,
              :email,
              :image

  def initialize(data)
    @name = data[:name]
    @bio  = data[:bio].sub('~', ',')
    @email = data[:email]
    @image = data[:image]
  end
end
