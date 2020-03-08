class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif if req.path.match(/cart/)
      cart.each do |cart_item|
        resp.write "#{cart_item}\n"
      end
    elsif if req.path.match(/add/)
      add_term = req.params["item"]
      resp.write handle_add(add_term)
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

  def handle_add(add_term)
    if @@items.include?(add_term)
      return "#{add_term} is one of our items"
      cart<<add_term
    else
      return "Couldn't find #{add_term}"
    end
  end
  
  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
