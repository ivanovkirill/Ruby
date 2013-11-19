require "sinatra"

get '/' do
  <<-HTML
    <form method="post" action="/generate">
      <p><b>What passowrd do you want</b><Br>
    
      <input type="checkbox" name="@how_to_gen[]" value="1"> Choose this if you want to capitalize your passwrd<Br>
      <input type="checkbox" name="@how_to_gen[]" value="1"> Choose this if you want to add some digits<Br>
      <input type="checkbox" name="@how_to_gen[]" value="1"> Choose this if hate ambiguos characters<Br>
      <input type="checkbox" name="@how_to_gen[]" value="1"> and the last one to generate random password<Br>
      
      <p><b>What is the length of the password do you want?(from 8 to 30)</p></b>
      <p><input type="number" name="password" size"3" min="8" max="30" required></p>
      <p><input type="submit" value="Magic"></p>
     </form>
   HTML
end

post '/generate' do
  @password_length = params[:password]
  @how_to_gen = params['@how_to_gen']
  pwgen_string = 'pwgen '
  p @password_length
  #p @how_to_gen
  gen = ""
  if @password_length.to_i > 7 && @password_length.to_i < 31 
    @how_to_gen.each do |type|
      if type == "1"
	gen = ' -n'
      end
      if type == "2"
	gen = ' -c'
      end
      if type == "3"
	gen = ' -B'
      end
      if type == "4"
	gen = ' -s'
      end
    end
    # i have no idea why i write this :
    # something wrong with gen_type
    # 
    output = ""
    length_type = @password_length + "1"
    output=pwgen_string + gen
    output=output + length_type
    output = `#{output}`
    p "\nYour password is "+ output
   else
    p "Incorrect input, try again"
  end
end
      