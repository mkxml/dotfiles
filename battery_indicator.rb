#!/usr/bin/env ruby
# encoding: utf-8
# Original script from PogiNate on https://gist.githubusercontent.com/PogiNate/5490603/raw/499ef967fe724edb267c593fd6f04b5b0a9a1e61/battinfo.rb
battery = "🔋"
plug    = "⚡"

v = Hash.new()

ARGF.each do |a|
  if a.start_with? "Now"
    #test for the first line
    if a =~ /'(.*)'/
      v[:source] = $~[1]
    else
      v[:source] = ""
    end
  elsif a.start_with?" -"
    if a =~ /(\d{1,3})%;\s(.*);\s(\d:\d{2}|\(no estimate\))/
      v[:percent] = $~[1].to_i
      v[:state] = $~[2]
      v[:time] = $~[3]
    else
      v[:percent] = "0"
      v[:state] = "unknown"
      v[:time] = "unknown"
    end
  end
end
outstring = ""
if v[:source] == "Battery Power"
  outstring += "#{battery}  "
  outstring += v[:time] == "0:00" ? " charged" : " #{v[:time]}"
else
  outstring += "#{plug} "
end

puts outstring
