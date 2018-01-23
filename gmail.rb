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
pp h_recep # affiche proprement ce hash

=begin
recepteurs.each do |recepteur|
  email = gmail.compose do
    to recepteur
    subject "Having fun à THP #{recepteur}!"
    body "Cher #{recepteur}, \nSpent the day on the code…"
  end
  email.deliver! # or: gmail.deliver(email)
end
=end

gmail.logout
