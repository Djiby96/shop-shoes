/*
    1. Afficher la liste des ventes : chaussures & accessoires
*/

var con = require("./MySQL.js"),
    pagination = require("./pagination.js"),
    fs = require("fs");


var ShoesAccessory = {
    // 1
    page_chaussures_accessoires : (req, res) =>{
        var categorie = req.params.categorie_produit;

        if(categorie != 'chaussures' && categorie !='accessoires'){
            res.redirect("/");
        }else{
            var R_PRODUCTS = `SELECT chemin, titre, prix, numero, categorie, genre, type, marque, status, date, REPLACE(FORMAT(prix, 0), ',', ' ') AS 'prix_format', REPLACE(titre, ' ', '-') AS 'titre_concat' FROM produit INNER JOIN images USING(numero) ` + 
                             `WHERE status='en stock' AND categorie='${categorie}' `

            var R_PRODUCT_SIZE = `SELECT count(*) FROM produit WHERE categorie='${categorie}'`;


            if(categorie == "chaussures"){
                var data = fs.readFileSync("./backend-modules/c.js", "utf-8");
            }else{
                var data = fs.readFileSync("./backend-modules/a.js", "utf-8");
            }

            var p = JSON.parse(data);

            // query
            var page = parseInt(req.query.page) || 1,
                genre = req.query.genre,
                type = req.query.type,
                prix_order = req.query.prix;
            if(genre){
                // if(genre == 'homme'){
                //     R_PRODUCTS = R_PRODUCTS + `AND (genre='homme' || genre='homme-femme') `
                // }else if(genre == 'femme'){
                //     R_PRODUCTS = R_PRODUCTS + `AND (genre='femme' || genre='homme-femme') `
                // }else{
                //     R_PRODUCTS = R_PRODUCTS + `AND genre='${genre}' `    
                // }

                if(genre =="enfant-bebe" || genre =="homme-femme"){
                    p.forEach((product, index) =>{
                        if(product.genre != genre){
                            delete p[index];
                        }
                    })
                }else{
                    p.forEach((product, index) =>{
                        if(product.genre != genre && product.genre !='homme-femme'){
                            delete p[index];
                        }
                    })
                }
            }

            if(type){
                R_PRODUCTS = R_PRODUCTS + `AND MATCH(type) AGAINST('${type}') ` 

                p.forEach((product, index) =>{
                    if(product.type != type){
                        delete p[index];
                    }
                })
            }

            if(prix_order){
                R_PRODUCTS = R_PRODUCTS + `AND prix !=0 `
                var order_price = `prix ${prix_order}, `
            }else{
                var order_price = ``;
            }

            var N = 50,
                URL = req._parsedOriginalUrl,   
                pagination_link = pagination.createPaginationLink(N, page, URL, 60);

            res.render("chaussures_accessoires.html", {
                categorie: categorie,
                products: p,
                pagination_link: pagination_link
            }) 

            R_PRODUCTS = R_PRODUCTS + `ORDER BY ` + order_price + `date DESC LIMIT ${(page - 1)*40}, 40`
            
            //request database
            // var R = R_PRODUCTS + ";" + R_PRODUCT_SIZE;
            // con.query(R, (err, rs) =>{
            //     if(err){
            //         res.redirect("/");
            //     }else{
            //         var products = rs[0];

            //         var d = JSON.stringify(products);
            //         fs.writeFileSync("./backend-modules/a.js", d)

            //         // pagination
            //         var N = rs[1][0]['count(*)'],
            //             URL = req._parsedOriginalUrl,   
            //             pagination_link = pagination.createPaginationLink(N, page, URL, 40);

            //         // render data
            //         res.render("chaussures_accessoires.html", {
            //             categorie: categorie,
            //             products: products,
            //             pagination_link: pagination_link
            //         })  
            //     }
            // })

        }
    }
}

module.exports = ShoesAccessory;