# Write your solution here!
#pp "hello world"
require "rqrcode"
require "dotenv/load"
pp "What kind of QR code would you like to generate today?"
pp "1. Open a URL"
pp "2. Join a wifi network"
pp "3. Send a text message"
pp "Write 4 to exit"
user_answer=gets.chomp
if user_answer!= "4"
  if user_answer == "1"
    pp "What is the URL you would like to encode?"
    user_url= gets.chomp
    qrcode=RQRCode::QRCode.new(user_url)
    pp "What would you like to call the PNG?"
    user_png_name=gets.chomp
    png=qrcode.as_png({:size => 500})
    IO.binwrite("#{user_png_name}.png", png.to_s)
  elsif user_answer== "2"
    pp "What is the name of the wifi network?"
    user_wifi_name=gets.chomp
    pp "What is the password?"
    user_wifi_password=gets.chomp
    qrcode=RQRCode::QRCode.new("WIFI:T:WPA;S:"+ user_wifi_name + ";P:"+ user_wifi_password + ";;")
    pp "What would you like to call the PNG?"
    user_png_name=gets.chomp
    png=qrcode.as_png({:size => 500})
    IO.binwrite("#{user_png_name}.png", png.to_s)
  elsif user_answer== "3"
    pp "What is the phone number you want the code to send a text message to?"
    user_sms_number=gets.chomp  
    pp "What do you want to write in the message?"
    user_sms_message=gets.chomp 
    qrcode=RQRCode::QRCode.new("SMSTO:"+ user_sms_number + ":" + user_sms_message)
    pp "What would you like to call the PNG?"
    user_png_name=gets.chomp 
    png=qrcode.as_png({ :size => 500})
    IO.binwrite("#{user_png_name}.png", png.to_s) #HERE "#{NAME}.png"
  else pp "Didn't recognize that selection. Please try again"
  end
end
