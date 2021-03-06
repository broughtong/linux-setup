import urllib2
import re
import datetime

get = urllib2.urlopen('https://www.restauracekathmandu.cz/denni-menu')
html = get.read()
response = re.sub(r'\<.*?\>', '', html)
response = response.replace("&nbsp;","")
response = response[response.find("menu / Daily menu"):response.find("Ke ka")]
response = response.split("\n",2)[2];
day = datetime.datetime.today().weekday()
if day == 0:
    response = response[response.find("MONDAY"):response.find("TUESDAY")]
    #    response = response[:response.rfind('\n')]
elif day == 1:
    response = response[response.find("TUESDAY"):response.find("WEDNESDAY")]
    #    response = response[:response.rfind('\n')]
elif day == 2:
    response = response[response.find("WEDNESDAY"):response.find("THURSDAY")]
    #    response = response[:response.rfind('\n')]
elif day == 3:
    response = response[response.find("THURSDAY"):response.find("FRIDAY")]
    #    response = response[:response.rfind('\n')]
elif day == 4:
    response = response[response.find("FRIDAY"):-1]
else:
    response = "No Indian on the weekends!!!!"
response = response.replace('1.', '\n1.')
response = response.replace('2.', '\n2.')
response = response.replace('3.', '\n3.', 1)
response = response.replace('4.', '\n4.', 1)
response = response.replace('5.', '\n5.', 1)
response = response.replace('6.', '\n6.')
# remove lines, containing only whitespaces
lines = response.split('\n')
lines = [line for line in lines if line.strip() != '']
# join lines except the last one (containing the next day's name)
response = '\n'.join(lines[0:-1])
print(response)
