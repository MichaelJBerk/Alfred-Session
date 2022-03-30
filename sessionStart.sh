#!/usr/bin/python3
import json
import os
import sys
#from pathlib import path
from os.path import expanduser
userpath = os.path.expanduser('~')
filepath = userpath + '/Library/Containers/com.philipyoungg.session-setapp/Data/Library/Application Support/com.philipyoungg.session-setapp/Default/Projects'
#print(filepath)
size = os.path.getsize(filepath)
#print(size)
f = open(filepath, 'r')
filecontent = f.read(size)
projects = json.loads(filecontent)
rProjects = []
for p in projects:
	title = p['title']
	id = p['id'],
	x = {
		"uid": id,
		"title": title,
		"match": title,
		"arg": id,
		"subtitle": 'Start Session with category "' + title + '"',
		"autocomplete": title,
	}
	rProjects.append(x)
#	sys.stdout.write(p['title'] + "\n")
items = {
	"items": rProjects
}
sys.stdout.write(json.dumps(items))
