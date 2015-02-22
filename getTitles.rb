#!/usr/bin/env ruby
# Copyright 2015 Jakob Nylin (jakob [dot] nylin [at] gmail [dot] com)
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ''AS IS'' AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require 'optparse'

options = {}
OptionParser.new do |opts|
	opts.on("--min [MIN]", "Minimun number of copies for showing the title" ) do |m|
		options[:min] = m.to_i
	end
end.parse!

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
	if value >= options[:min]
		puts "#{key.strip};#{value}"
	end
end
