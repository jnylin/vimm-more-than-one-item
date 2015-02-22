#!/usr/bin/ruby

input = ARGF.read
titles = Hash.new

i = 0
title = ""
input.each_line do |line|

	if i == 0
		title = line
	end

	if title == line
		i += 1
		titles[title] = i
	else
		i = 1
		title = line
		titles[title] = i
	end


end


titles.each do |key,value|
	puts "#{key.strip};#{value}"
end
