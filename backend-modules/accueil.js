/*
    1. Afficher la page d'accueil
*/

var con = require("./MySQL.js")

var Accueil = {
    // 1
    page_accueil : (req, res) =>{
        var R_PRODUCTS = `SELECT chemin, titre, prix, numero, categorie, genre, type, marque, status, date, REPLACE(FORMAT(prix, 0), ',', ' ') AS 'prix_format', REPLACE(titre, ' ', '-') AS 'titre_concat' FROM produit INNER JOIN images USING(numero) ` + 
                         `WHERE status='en stock' ORDER BY date DESC LIMIT 0, 10`;

        //select data  
        con.query(R_PRODUCTS, (err, rs) =>{
            if(err){
                var products = []
            }else{
                var products = rs;
            }
            res.render("accueil.html", {
                products: products
            });
        })
    }
}

module.exports = Accueil;