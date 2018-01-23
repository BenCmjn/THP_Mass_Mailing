require "google_drive"
require 'rubygems'
require 'json'
require 'pp'
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#!!!!!!!!!!!!!!!! POUR LA PROCHAINE LIGNE, VOUS DEVEZ AVOIR VOTRE FICHIER "config.json" DANS LE DOSSIER DE CE FICHIER
session = GoogleDrive::Session.from_config("config.json") # Créons une session Google Drive
my_sheet = session.spreadsheet_by_key("12VvLs5ia0nsx9H00_MwkGbxM6DH7eDlCt1H3icS9umM").worksheets[0] # première feuille de https://docs.google.com/spreadsheets/d/12VvLs5ia0nsx9H00_MwkGbxM6DH7eDlCt1H3icS9umM/edit#gid=0
my_json = File.read('cities_hashed.json') # prenons le json qui nous intéresse
################## Fin des initialisation ####################
def go_through_each_element_of_hash #
  
end

def get_the_name_and_put_it_in_spreadsheet #

end
def get_the_email_and_put_it_in_spreadsheet #

end
##################### Fin des méthodes #######################
#-------------------------- START --------------------------#
my_hash = JSON.parse(my_json) # Stockons ce json dans une variable, après l'avoir parser en hash
# Nous pouvons observer ce hash. C'est beau.
# pp my_hash

focus = 0 # on crée un compteur
  my_hash.each do |clef, valeur| # pour chaque index du hash :
    focus += 1 # On incrémente le compteur
    my_sheet[focus, 1] = clef # On écrit la clef du hash (ville) en case [rangée où on est focus, 1]
    my_sheet[focus, 2] = valeur # On écrit la valeur du hash (email) en case [rangée où on est focus, 2]
    puts "écriture de la ligne n° #{focus}" # Un petit puts, histoire de s'assurer que tout va bien
  end

my_sheet.save # on enregistre le tableau

##################### Fin du programme #####################
