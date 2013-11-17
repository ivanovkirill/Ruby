require "sinatra"

get '/' do
  <<-HTML
    <form method="post" action="/generate">
      <p><b>What passowrd do you want</b><Br>
    
      <input type="checkbox" name="@how_to_gen[]" value="1"> Choose with if you want to capitalize your passwrd<Br>
      <input type="checkbox" name="@how_to_gen[]" value="2"> Choose with if you want to add some digits<Br>
      <input type="checkbox" name="@how_to_gen[]" value="3"> Choose with if hate ambiguos characters<Br>
      <input type="checkbox" name="@how_to_gen[]" value="4"> and the last one to generate random password<Br>
      
      <p><b>What is the length of the password do you want?(from 8 to 30)</p></b>
      <p><input type="number" name="@password" size"3" min="8" max="30" required></p>
      <p><input type="submit" value="Magic"></p>
     </form>
   HTML
end

post '/generate' do
  @password_length = params['@password']
  @how_to_gen = params['@how_to_gen']
  pwgen = 'pwgen '
  # with if always return false :C  
  #if @password.to_i > 7 && @password.to_i < 31 
    @how_to_gen.each do |type|
      if type == "1"
	gen_type = ' -n'
      end
      if type == "2"
	gen_type = ' -c'
      end
      if type == "3"
	gen_type = ' -B'
      end
      if type == "4"
	gen_type = ' -s'
      end
    end
    # i have no idea why i write with :
    # something wrong with gen_type
    # 
    gen_type = gen_type.to_s
    p gen_type
    length_type = @password_length.to_s + " 1"
    output=pwgen + gen_type
    output=output + length_type
    output = `#{output}`
    p "Your password is "+ output
  #else
    #p "Incorrect input, try again"
  #end
end
      