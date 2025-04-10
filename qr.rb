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
user_answer=""
while user_answer!="4"
  
qr_https=qrcode=RQRCode::QRCode.new(user_https)
#qrcode=RQRCode::QRCode.new("WIFI:T:WPA;S:UPC303;P:"+ ENV.fetch("supersecretpassword") + ";;")
qrcode=RQRCode::QRCode.new("SMSTO:9876543210:Hi Alice! It's")
png=qrcode.as_png({:size => 500})
IO.binwrite("sometext.png", png.to_s)
