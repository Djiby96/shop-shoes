/*
    1. Page ajouter une vente

    2. Ajouter une vente
*/

var con = require("./MySQL.js"),
    Files = require("./Files.js");


var AddProduct = {
    // 1
    page_ajouter_produit : (req, res) =>{
        var cc = req.signedCookies.cc;
        if(!cc){
            res.redirect("/connexion-admin")
        }else{
            res.render("ajouter_produit.html");
        }
    },

    // 2
    addProduct : (req, res) =>{
        var cc = req.signedCookies.cc;
        if(!cc){
            res.redirect("/espace-admin/ajouter-produit")
        }else{
            var b = req.body,
                files = req.files;
                   
        //download files
        var img_data_table = Files.upload(files, "./images/product/")
            
        // table product
        var T_produit = [img_data_table[2], b.titre, b.prix, b.categorie, b.genre, b.type || "", b.description]
        var R_produit = "INSERT INTO produit(numero, titre, prix, categorie, genre, type, description) VALUES (?)"
        // table image
        var T_image = img_data_table;
        var R_image = "INSERT INTO images(chemin, nombre_images, numero) VALUES (?)" 

        var D = [T_produit, T_image]
        var R_D = "START TRANSACTION;" + R_produit + ";" + R_image + ";COMMIT";
        con.query(R_D, D, (err, rs) =>{
            if(err){
                res.redirect("/espace-admin/ajouter-produit")
            }else{
                req.flash("message", "success/Vente ajoutée avec succès.")
                res.redirect("/espace-admin/ajouter-produit");
            }
        })

       }
    }
}

module.exports = AddProduct;