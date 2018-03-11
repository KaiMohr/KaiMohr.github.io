require 'rubygems'
#require 'selenium-websession'
require 'capybara'
require 'capybara/poltergeist'
require 'date'

# require_relative 'fileOperationsHelperFunctions'
# require_relative 'speakOutLoudHelperFunction'

# Lets get all job offers according to the parameters passed into the function
# Then i write the result into a text file

def getJobUpdateIndeedES (searchString, targetCity)
  @searchString
  @targetCity

# start recording time
start = Time.now

# lets get the date
date = Time.new
#set 'date' equal to the current date/time. 

date = date.year.to_s + "-" + date.month.to_s + "-" + date.day.to_s   

# ************************************************
# Now I set the console log to write into a file
# For some reason the line below throughs an javascript error suppossed to be fixed in phantomjs update
# $stdout = File.new("./indeedES-#{targetCity}-#{searchString}.txt", 'w')
# ************************************************


# select the firefox session
# session = Selenium::Websession.for :firefox
# select the phantomJS session
# session = Capybara::Session.new(:poltergeist)
session = Capybara::Session.new(:poltergeist)
# searchString = "qa"
# targetCity = "Barcelona"

session.visit("http://www.indeed.es")
session.fill_in('text-input-what', with: "#{searchString}")
session.fill_in('text-input-where', with: "#{targetCity}")
#session.find("icl-WhatWhere-button").click
session.click_button('Buscar ofertas')
howmanyOffers = session.find('#searchCount')
# get the text and remove 1 a 10 de from the string
howmanyOffers = howmanyOffers.text.gsub( 'Ofertas de trabajo 1 a 10 de', '' )


# puts howmanyOffers

###################
finish = Time.now
diff = finish - start
# puts "timer: #{diff}"

searchdate =  Time.now.strftime("%d/%m/%Y")

# speakerVoice = "Tom"
# readingSpeed = "180"

 puts " Search results for search term #{searchString}, and city #{targetCity}. I have found #{howmanyOffers} job offers at #{searchdate}"

resultsHeaderText = " Search results for search term #{searchString}, and city #{targetCity}. I have found #{howmanyOffers} job offers at #{searchdate}"


# speakOutLoud(" Search results for search term #{searchString}, and city #{targetCity}. I have found #{howmanyOffers} job offers",readingSpeed , speakerVoice)
# <div id="searchCount">Ofertas de trabajo 1 a 10 de 130</div>

# lets create to Array to store the job title and company name in
  $jobTitles = Array.new
  $jobCompanies = Array.new

# Then i fill the array with the text from the page

  session.all(:css, '.jobtitle').each do |el|
# $jobTitles  += [el.text.gsub("Stellenanzeige merken", " ")]
 $jobTitles  += [el.text]
 # puts $jobTitles
 end
# And i get the company names. no cleaning needed here
  session.all(:css, '.company').each do |el|
  $jobCompanies  += [el.text]
#  puts $jobCompanies
end

# Now I am setting a counter variable
  $i = 0
# And find out how many job titles are in the array
  $num = $jobTitles.length


# I create  the file and put the result header text into it
  File.open("#{date}-#{searchString}-#{targetCity}.md", 'a') do |append|  
    append.puts "---"
    append.puts "layout: post"
    append.puts "title:  "#{searchString}-#{targetCity}"
    append.puts "date:  #{date} "
    append.puts "categories: jobsearch "
    append.puts "excerpt_separator: <!--more-->"
    append.puts "---"
    append.puts "#{resultsHeaderText}"
    append.puts "<!--more-->" 
end  


# Then i loop through the array as long as there are job titles
# And write those to the console
# I could also read them with the speakOutLoud function


while $i <= $num  do

  puts $i + 1
  puts $jobTitles[$i]
 # speakOutLoud("#{$jobTitles[$i]}", 180, "Daniel" )
  puts $jobCompanies[$i]
 # speakOutLoud("#{$jobCompanies[$i]}", 180, "Daniel" )
  

# Create a new file and write to it  





File.open("#{date}-#{searchString}-#{targetCity}.md", 'a') do |f2|  
  # use "\n" for two lines of text  
   f2.puts "<br>"
    f2.puts $i + 1
    f2.puts '![logo]({{ "/images/rocket.png" | absolute_url }})'
    f2.puts $jobTitles[$i]  
    f2.puts "<br>"
    f2.puts $jobCompanies[$i]  


  $i +=1
end  



end
# Then i calculate the difference between the time the script started and the time now
  finish = Time.now
  diff = finish - start
# And print to the console
  puts "It took #{diff} seconds to complete the test"
end
# function end

  getJobUpdateIndeedES("qa", "Madrid")
  getJobUpdateIndeedES("ruby", "Madrid")
  getJobUpdateIndeedES("big data", "Madrid")
  getJobUpdateIndeedES("java", "Madrid")

  getJobUpdateIndeedES("qa", "Barcelona")
  getJobUpdateIndeedES("ruby", "Barcelona")
  getJobUpdateIndeedES("big data", "Barcelona")
  getJobUpdateIndeedES("java", "Barcelona")

  getJobUpdateIndeedES("qa", "Malaga")
   getJobUpdateIndeedES("qa", "Malaga")
  getJobUpdateIndeedES("big data", "Malaga")
 getJobUpdateIndeedES("java", "Malaga")

