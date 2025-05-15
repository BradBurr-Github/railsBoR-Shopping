class HomeController < ApplicationController
  def index
    #render plain: "Hello World from Rails 8"
    message = "<h1>Hello World from Rails 8</h1>"
    message += "<h2>Hello World from Rails 8</h2>"
    message += "<h3>Hello World from Rails 8</h3>"
    message += "<h4>Hello World from Rails 8</h4>"
    message += "<h5>Hello World from Rails 8</h5>"
    message += "<h6>Hello World from Rails 8</h6>"
    render html: message.html_safe
  end

  def getquerystringvalues
    message = ""
    if params[:message]
      message = "<h1>Message is: " + params[:message] + "</h1>"
    else
      message = "<h1>You have not supplied any value for message.</h1>"
    end
    if params[:country]
      message += "<h1>Country is: " + params[:country] + "</h1>"
    else
      message += "<h1>You have not supplied any value for country.</h1>"
    end
    message += "<h1>Controller name is: " + params[:controller] + "</h1>"
    message += "<h1>Action name is: " + params[:action] + "</h1>"
    render html: message.html_safe
  end

  def passdatatoviews
    @message = "<h1>Hello World from Rails 8</h1>"
    @message += "<h2>Hello World from Rails 8</h2>"
    @message += "<h3>Hello World from Rails 8</h3>"
    @message += "<h4>Hello World from Rails 8</h4>"
    @message += "<h5>Hello World from Rails 8</h5>"
    @message += "<h6>Hello World from Rails 8</h6>"
  end

  def showdatetimeinfo
    @currenttime=DateTime.now
  end

  def conditionalrendering
    @data={
      'name':'Jimmy Anderson',
      'isVisible':true,
      'loggedIn':false,
      'countryCode':'UK',
      'workExperience':45,
      'stateCode':nil
    }
  end

  def loopthrougharrays
    @Products = []

    #console

    fnum=10
    snum=5
    add=fnum+snum
    subtract=fnum-snum
    multiply=fnum*snum
    divide=fnum/snum
    
    @Products.push( {'productID':1,'productName':"AMD Ryzen 3990",quantity:100,unitsInStock:50,'discontinued':false,cost:3000} )
    @Products.push( {'productID':2,'productName':"AMD Ryzen 3980",quantity:100,unitsInStock:50,'discontinued':false,cost:4000} )
    @Products.push( {'productID':3,'productName':"AMD Ryzen 3970",quantity:100,unitsInStock:50,'discontinued':false,cost:5000} )
    @Products.push( {'productID':4,'productName':"AMD Ryzen 3960",quantity:100,unitsInStock:50,'discontinued':false,cost:6000} )
    @Products.push( {'productID':5,'productName':"AMD Ryzen 3950",quantity:100,unitsInStock:50,'discontinued':false,cost:7000} )
    @Products.push( {'productID':6,'productName':"AMD Ryzen 3940",quantity:100,unitsInStock:50,'discontinued':true,cost:8000} )
    @Products.push( {'productID':7,'productName':"AMD Ryzen 3930",quantity:100,unitsInStock:50,'discontinued':true,cost:9000} )
    @Products.push( {'productID':8,'productName':"AMD Ryzen 3920",quantity:100,unitsInStock:50,'discontinued':true,cost:10000} )
  end

  def LoadUsers()
    base_url = "https://fakestoreapi.com/users"
    @users = CallRestAPI(base_url)
  end

  def CallRestAPI(base_url)
    response = HTTParty.get(base_url)
    return response.success? ? response : []
  end

  def LoadUsers2()
    base_url = "https://fakestoreapi.com/users"
    @image = 'https://i.pravatar.cc'
    @users = CallRestAPI(base_url)
  end

  def ShowUserDetails()
    redirect_to LoadUserDetails_path(1)
  end

  def LoadUserDetails()
    id = params[:id].to_i
    if id > 10
      redirect_to LoadUserDetails_path(1)
      return
    elsif id < 1
      redirect_to LoadUserDetails_path(10)
      return
    end
    response = HTTParty.get("https://fakestoreapi.com/users/#{id}")
    if response.success?
      @user = response
    end
  end
end

