# -*- encoding : utf-8 -*-
class Subdomain
  def self.matches?(request)

    case request.host
    when Figaro.env.host, "www.#{Figaro.env.host}", nil
      false
    when 
      "aareview.herokuapp.com"
    else
      true
    end  
  end

end
