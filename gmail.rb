require 'pry' # Au cas où
require 'pp' # Au cas où
require 'gmail' #Gem Gmail : https://github.com/gmailgem/gmail
require_relative 'log' # Pour pas mettre ses logs dans ce fichier.
gmail = Gmail.connect(USERNAME, PASSWORD) # Connexion
# puts gmail.inbox.count # compte dans la boite de reception


# On créé un tableau de récepteurs de mon email
recepteurs = ["alice.thp@yopmail.com","bob.thp@yopmail.com","carole.thp@yopmail.com"]
# On créé un tableau de noms de récepteurs
nom_recep = ["Alice","Bob","Carole"]
# On créé un HASH de récepteurs de mon email
h_recep = recepteurs.zip(nom_recep).to_h # Crée le hash des deux tableaux créés
# pp h_recep # affiche proprement ce hash

# binding.pry # Plus tard PRY !

h_recep.each do |email,nom|
  bonjour = gmail.compose do
    to email
    subject "Having fun à THP #{nom}!"
    body "Cher #{nom}, \n Je suis très contents que tu lise ce mail…"
  end
   gmail.deliver(bonjour) # bonjour.deliver!
end

puts "les #{h_recep.length} emails ont été envoyés"
gmail.logout