---
layout: page
title:  detecting text in images
date:  2018-3-4
categories: languages
excerpt_separator: <!--more-->
---
Let's loop through a folder of images and capture all the text.  
<!--more-->
<!-- ![_config.yml]({{ site.baseurl }}/images/20170806_203330.jpg)
-->

<html>
<body>


I want to have the subtitles from all the images.


      <a href='https://lh3.googleusercontent.com/mF6I-kAky00IGGnP1O6bHL-YW-NvfQxFMQ9gXcUByaZBaV3dHHqvnjBMuKvT2kM6liQ547zAgJ5Dti0SWXerT06qc42vH0IvguYEhoIrcj0GLAXrMtdqX1gFCHRUxe2oeg6yq8mOgkhflWqa1yroqFGqJc_UOSipMA-th_f4ky8t4DaA1_psd4roRQpBbZJxnAroiFceBQQhzaoXr-wDhRVkLZBom6cAWrtxWNdx6XeyZ8B7PGKn9QH-vUxMQxTV8dbWLS5mEeEHL3wiSqlYw2eHQX9BICToTdexeq4sT-7kraolfRIMI79BzQmgNXB7uSUiKZyHn4StqbeDYHa67u1zxeSjzM5fFnWTfDxEjJ3f3MQ5_1hlMp1e-aydiwq3w4s6pBKS9ceWhF19wIE0QydDVndsq-WGw7jEbd00o-m3_3-dQfgCjV6RuzLorn1dR7gEfMEy2KEgDMc6Ik-JM8K7JZ-gAZusG7Oj5qA-YiZZuQ9LmCaIOmjYoJG8s6LX1j7rMO5VSwS6-CiHnDJYXQ7zD3H7GKthQvUA1FYMHREwe1gnVOqk7LySVAK4385MVYreq0SaoG8-yreQu2ImX0nDEoEQIG5HSAnK_IU=w1748-h983-no'><img src='https://lh3.googleusercontent.com/mF6I-kAky00IGGnP1O6bHL-YW-NvfQxFMQ9gXcUByaZBaV3dHHqvnjBMuKvT2kM6liQ547zAgJ5Dti0SWXerT06qc42vH0IvguYEhoIrcj0GLAXrMtdqX1gFCHRUxe2oeg6yq8mOgkhflWqa1yroqFGqJc_UOSipMA-th_f4ky8t4DaA1_psd4roRQpBbZJxnAroiFceBQQhzaoXr-wDhRVkLZBom6cAWrtxWNdx6XeyZ8B7PGKn9QH-vUxMQxTV8dbWLS5mEeEHL3wiSqlYw2eHQX9BICToTdexeq4sT-7kraolfRIMI79BzQmgNXB7uSUiKZyHn4StqbeDYHa67u1zxeSjzM5fFnWTfDxEjJ3f3MQ5_1hlMp1e-aydiwq3w4s6pBKS9ceWhF19wIE0QydDVndsq-WGw7jEbd00o-m3_3-dQfgCjV6RuzLorn1dR7gEfMEy2KEgDMc6Ik-JM8K7JZ-gAZusG7Oj5qA-YiZZuQ9LmCaIOmjYoJG8s6LX1j7rMO5VSwS6-CiHnDJYXQ7zD3H7GKthQvUA1FYMHREwe1gnVOqk7LySVAK4385MVYreq0SaoG8-yreQu2ImX0nDEoEQIG5HSAnK_IU=w1748-h983-no' /></a>


<!--
          <p>
          <a href='https://photos.google.com/share/AF1QipN3Cn-KyOW8CnNmrnzKsAPOkWjN76t1dxgj_n96h07GSGs6BToEpO6On7UhI1PSfQ?key=ck5EeEdHZ3hJeWdDOU9xZFBRd1VTa0Z3V1pVN0xn&source=ctrlq.org'><img src='https://lh3.googleusercontent.com/WHg_A0wregKB5SonPBv1jwnETAd0l8p2dyr-DxG5n_sM6Ey20WE1M4bexBX53bf_JBWw67WOsL6T' /></a>
        </p>
        <p>
        <em>This image is directly hosted through Google Photos.</em>
        </p>
-->







{% highlight ruby %}

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
     e

{% endhighlight %}

HBO
{% for image in site.static_files %}
  {% if image.path contains '/images/hbo' %}
      <a href="{{ site.url}}{{image.path }}">
        <img src="{{ site.url | append: image.path }}" alt="">
      </a>
  {% endif %}
{% endfor %}


THE OTHER
{% for image in site.static_files %}
  {% if image.path contains '/images/theother' %}
      <a href="{{ site.url}}{{image.path }}">
        <img src="{{ site.url | append: image.path }}" alt="">
      </a>
  {% endif %}
{% endfor %}


</body>
</html>
