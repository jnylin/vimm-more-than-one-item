#!/bin/bash
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

MIN=${MIN:-1}
if [ -z "$1" ]; then
	INPUT=/dev/stdin
else
	INPUT=$1
fi
# Associative array with the title as index and the number of items as the value
declare -A titles

i=0
while read line
do
	if [ $i -eq 0 ]; then
		title=$line
	fi

	if [ "${title}" = "${line}" ]; then
		i=$((i+1))
		titles[${title}]=$i
	else
		i=1	
		title=$line
		titles[${title}]=$i
	fi

done < $INPUT

# Looping through titles and print how many items there is
for key in "${!titles[@]}"; do
	if [ ${titles[$key]} -ge $MIN ]; then
		echo "${key}; ${titles[$key]}"
	fi
done
