class Enumeration
  def Enumeration.add_item(key,value)
    @hash ||= {}
    @hash[key]=value
  end

  def Enumeration.const_missing(key)
    @hash[key]
  end   

  def Enumeration.each
    @hash.each {|key,value| yield(key,value)}
  end

  def Enumeration.values
    @hash.values || []
  end

  def Enumeration.keys
    @hash.keys || []
  end

  def Enumeration.[](key)
    @hash[key]
  end
end

class Constants < Enumeration
  
  self.add_item(:TURK_API_KEY, 'AKIAJVJFVRKY6F6Q3TSA')
  self.add_item(:TURK_SECRET_KEY, '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')
  self.add_item(:BITLY_API_KEY, 'R_f1a014081a0d4abf6714c314addace0e')
  self.add_item(:SITE_NAME, 'WordsEye')
  url = (Rails.env.production?)? 'http://www.wordseye.com': 'http://localhost:3000'
  self.add_item(:SITE_URL, url)
  
end
