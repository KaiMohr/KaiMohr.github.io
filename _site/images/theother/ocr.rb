 capturename = "finishedfile"

allFilesInDirectory = Dir.glob("*.jpg")
allFilesAmount = allFilesInDirectory.size
i = 0
 while i < allFilesAmount
#      puts `convert #{allFilesInDirectory[i]} -crop 0x400+150+850 #{allFilesInDirectory[i]}` 
#      puts `convert #{allFilesInDirectory[i]} -level 55%,75% -negate #{allFilesInDirectory[i]}` 
#      puts `convert #{allFilesInDirectory[i]} -modulate 900,100,100 #{allFilesInDirectory[i]}` 
puts "start"
      notext = `convert #{allFilesInDirectory[i]} -format '%[mean] %[max]]' info:- | awk '{print $1/$2}'` 
      puts notext
      puts "------"
      if notext.to_i > 0.990000 
         puts "blank found  ---------> #{notext} #{allFilesInDirectory[i]} "
         thisblankfile = Dir.pwd + "/" + allFilesInDirectory[i] 
         puts "deleting ---------> #{notext} #{allFilesInDirectory[i]} "
         puts thisblankfile
         File.delete(thisblankfile) 
      else

 puts ` tesseract #{allFilesInDirectory[i]} #{capturename}#{i}` 
 outputtemp = capturename + "#{i}.txt" 
File.open("#{outputtemp}", "r") do |f|
f.each_line do |line|
ocrtext = line
open('finish.txt', 'a') { |f|
f << "#{ocrtext}"
}
puts ocrtext


      end
# convert 223553121.jpg -format '%[mean] %[max]' info:- | awk '{print $1/$2}'
# 0.991208
# convert 223553122.jpg -format '%[mean] %[max]' info:- | awk '{print $1/$2}'
# 1


end
File.delete("#{outputtemp}") if File.exist?("#{outputtemp}")
puts "END"
end 
   i += 1
     end
