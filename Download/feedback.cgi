#!/usr/bin/env python
# -*- coding: ISO-8859-1 -*-

##  feedback.py                                        Frank Lübeck
##
##  handler of the feedback form on the GAP web site
##  - formats the non-empty values of keys used in the form as text
##  - formats some interesting environment settings as text
##  - logs both texts with a time stamp in a logfile (adjust 'logto' below)
##  - sends both texts as mail (adjust 'mailto' below for recipient)
##  - returns a simple web page, citing the key-value text
##

# adjust these
mailto = 'support@gap-system.org'
logto = '/tmp/feedback.log'

import os, cgi, string

#  very nice for debugging
#import cgitb
#cgitb.enable()

form = cgi.FieldStorage()

items = [ "name", "institution", "city", "email", "linuxinst", "unixinst",
          "wininst", "macosinst", "macosxinst", "unixtype", "nrmachines",
          "nrusers", "formerinstall", "matharea", "remarks" ]
itemtexts = { "name":"Name",
          "institution":"Institution",
          "city":"City",
          "email":"Email",
          "linuxinst":"Linux installation",
          "unixinst":"UNIX installation",
          "wininst":"Windows installation",
          "macosinst":"Mac installation",
          "macosxinst":"Mac OS X installation",
          "unixtype":"Type of UNIX",
          "nrmachines":"Number of machines",
          "nrusers":"Number of users",
          "formerinstall":"Former installations",
          "matharea":"Area of mathematical interest",
          "remarks":"Further remarks" }

# collect the recognized form data

text1 = ['------------   GAP INSTALLATION FEEDBACK FORM  ----------\n\n']

for k in items:
  v = form.getlist(k)
  if len(v) > 0:
    text1.append(itemtexts[k])
    text1.append(': \n')
    if len(v) > 1:
      for i in xrange(len(v)):
        text1.append('[VALUE '+str(i+1)+'] '+v[i]+'\n')
    else:
      if v[0] == 'on':
        text1.append('yes\n')
      else:
        text1.append(v[0]+'\n')
    text1.append('\n\n')
text1 = string.join(text1, '')

# collect some interesting environment data

envitems = [ "HTTP_HOST", "HTTP_USER_AGENT", "HTTP_ACCEPT_LANGUAGE",
             "REMOTE_ADDR", "REMOTE_USER", "REMOTE_IDENT", "HTTP_REFERER" ]

text2 = ['------------   ENVIRONMENT  ----------\n\n']
for k in envitems:
  if os.environ.has_key(k):
    text2.append(k+': '+os.environ[k]+'\n\n')
text2 = string.join(text2, '')

# log into file
import time
out = open(logto, 'a')
out.write('>>>>>>>>>>>>>>> '+time.ctime()+'\n')
out.write(text1+text2)
out.close()

# write a mail
import popen2
def sendmail(txt):
  (out,inp) = popen2.popen2('mail -s "GAP Installation Feedback" '+mailto)
  inp.write(txt)
  out.close()
  inp.close()

sendmail(text1+text2)

# return a simple web page

page = '''<?xml version="1.0" encoding="ISO-8859-1"?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
                      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<style> body {background-color:white; color:#000088; } </style>

    <title>Thanks for installation feedback</title>
  </head>

  <body>
    <h1>Thanks for your feedback on a GAP installation</h1>

<p>
The following data are forwarded to the GAP team: </p>
<pre>
%s
</pre>
<p>
Use the "Back" button of your browser to get back to the GAP site.
</p>

  </body>
</html>
'''

print "Content-Type: text/html\n"
print page % text1


