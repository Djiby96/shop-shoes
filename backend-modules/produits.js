/*
   1. Afficher les produits cote admin

   2. Desactiver un produit
*/

var con = require("./MySQL.js"),
    pagination = require("./pagination.js");

// 1
var Products = {
    // 1
    page_produits : (req, res) =>{
        // get data
        var cc = req.signedCookies.cc;
        var page = parseInt(req.query.page) || 1;

        if(!cc){
            res.redirect("/connexion-admin")
        }else{
            var R_PRODUCTS = `SELECT chemin, titre, prix, REPLACE(FORMAT(prix, 0), ',', ' ') AS 'prix_format', numero, status, date FROM produit INNER JOIN images USING(numero) WHERE status='en stock' ORDER BY date DESC LIMIT ${(page - 1)*15}, 15`;
            var R_PRODUCT_SIZE = `SELECT count(*) FROM produit`
            var R = R_PRODUCTS + ";" + R_PRODUCT_SIZE;

            con.query(R, (err, rs) =>{
                if(err){
                    res.redirect("/espace-admin/produits");
                }else{
                    var products = rs[0];

                    // pagination
                    var N = rs[1][0]['count(*)'],
                        URL = req._parsedOriginalUrl,   
                        pagination_link = pagination.createPaginationLink(N, page, URL, 15);

                    // render data
                    res.render("produits.html", {
                        products: products,
                        pagination_link: pagination_link
                    })  

                }
            })
        }
    },

    // 2
    disable_product: (req, res) =>{
        var cc = req.signedCookies.cc;
        if(!cc){
            res.redirect("/connexion-admin")
        }else{
            var numero = req.params.numero;
            var R="UPDATE produit SET status='vendu' WHERE numero=?";
            con.query(R, [numero], (err, rs) =>{
                var url_from = req.headers.referer;
                if(rs){
                    req.flash("message", "success/Produit desactive avec succès.")
                }
                res.redirect(url_from);
            })

        }
    }

}

module.exports = Products;