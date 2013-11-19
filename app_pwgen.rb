require "sinatra"

get '/' do
  <<-HTML
    <form method="post" action="/generate">
      <p><b>What passowrd do you want</b><Br>
    
      <input type="checkbox" name="check[capitalize]" value="1"> Choose this if you want to capitalize your passwrd<Br>
      <input type="checkbox" name="check[digits]" value="1"> Choose this if you want to add some digits<Br>
      <input type="checkbox" name="check[ambiguos]" value="1"> Choose this if hate ambiguos characters<Br>
      <input type="checkbox" name="check[random]" value="1"> and the last one to generate random password<Br>
      
      <p><b>What is the length of the password do you want?(from 8 to 30)</p></b>
      <p><input type="number" name="password" size"3" min="8" max="30" required></p>
      <p><input type="submit" value="Magic"></p>
     </form>
   HTML
end

post '/generate' do
  if params[:password].to_i > 7 && params[:password].to_i < 31
    pw_string = 'pwgen '
    pw_string += '-c ' if params[:check][:capitalize]
    pw_string += '-n ' if params[:check][:digits]
    pw_string += '-B ' if params[:check][:ambiguos]
    pw_string += '-s ' if params[:check][:random]
    pw_string += params[:password] + " 1"
    output = pw_string
    output = `#{output}`
    p "\nYour password is "+ output
  else
    p "Incorrect input, try again"
  end
end
      