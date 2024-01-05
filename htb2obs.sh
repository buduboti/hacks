#!/bin/bash

htb_academy_session='eyJpdiI6Ik40Z3NaM3ZXR0NSamJPSDRPcjNOdUE9PSIsInZhbHVlIjoieDVUa2l4R1JJMFVKUHNMbFpiSmwxWTg1YjRoOFpoeS9yU3ZzRHZISlp2YUFwYVYyZVJzdmR3T2VQQmVuY0MxR3ZWWS93YmtZa0MxUUJNUmxsNTd0d01EM0p5S2J2dHd4d0JXTlJ4ZVpDeUE2RmluaFAwVnYxMDk1VkJvTTJDS3oiLCJtYWMiOiJiZGUwOWY0NzY0MzhmMTQzMTBjMTZkNmM0ZWFlYzQ1YjY4MTU3ZDllYzdiMzE5YTBlNzgyOGJmNmY3ZTA2NjQxIiwidGFnIjoiIn0%3D'

declare -a PageList=("https://academy.hackthebox.com/module/51/section/466"
"https://academy.hackthebox.com/module/51/section/1592"
"https://academy.hackthebox.com/module/51/section/1777")

for url in "${PageList[@]}"; do
	curl -L --cookie "htb_academy_session=$htb_academy_session" $url | xq -nq ".training-module"  
done | pandoc -f html -t markdown | sed 's/^#### /### /g' | grep -v "^::"
