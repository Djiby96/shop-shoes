/*
    1. Afficher la page d'accueil
*/

var con = require("./MySQL.js"),
    fs = require("fs");

var Accueil = {
    // 1
    page_accueil : (req, res) =>{
        var R_PRODUCTS = `SELECT chemin, titre, prix, numero, categorie, genre, type, marque, status, date, REPLACE(FORMAT(prix, 0), ',', ' ') AS 'prix_format', REPLACE(titre, ' ', '-') AS 'titre_concat' FROM produit INNER JOIN images USING(numero) ` + 
                         `WHERE status='en stock' ORDER BY date DESC LIMIT 0, 10`;


        var data = fs.readFileSync("./backend-modules/h_data.js", "utf-8");
        var p = JSON.parse(data);

        res.render("accueil.html", {
            products: p
        });                

        //select data  
        // con.query(R_PRODUCTS, (err, rs) =>{
        //     if(err){
        //         var products = []
        //     }else{
        //         var products = rs;
        //         var d = JSON.stringify(products);
        //         fs.writeFileSync("./backend-modules/h_data.js", d)
        //     }
        //     res.render("accueil.html", {
        //         products: products
        //     });
        // })
    }
}

module.exports = Accueil;