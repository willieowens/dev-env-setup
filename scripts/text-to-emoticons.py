import sys, getopt
from pyfiglet import figlet_format
import pyperclip

emoticon=':aawyeah:'

message = ''
argv = sys.argv[1:]
try:
   opts, args = getopt.getopt(argv,"ht:")
except getopt.GetoptError:
    print('text-to-emoticons.py -t <text>')
    sys.exit(2)
for opt, arg in opts:
   if opt == '-h':
      print('text-to-emoticons.py -t <text>')
      print('text: Message to be converted to emoticons.')
      sys.exit()
   elif opt in ("-t"):
      message = arg

message = message.replace("\\n", "\n")        
text = figlet_format(message, font='3x5')
print(text)

text = text.replace('#', emoticon)
text = text.replace(' ',':whitespace:')

with open("text-to-emoticons-output.txt", "w") as text_file:
    text_file.write(text)

pyperclip.copy(text)
