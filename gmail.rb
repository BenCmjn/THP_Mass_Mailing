require 'pry' # Au cas où
require 'gmail' #Gem Gmail : https://github.com/gmailgem/gmail
require_relative 'log' # Pour pas mettre ses logs dans ce fichier.

gmail = Gmail.connect(USERNAME, PASSWORD) # Connexion

puts gmail.inbox.count # compte dans la boite de reception

email = gmail.compose do
  to "test1thp@yopmail.com"
  subject "Having fun à THP!"
  body "Spent the day on the code…"
end
email.deliver! # or: gmail.deliver(email)

gmail.logout
