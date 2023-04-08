/*
    1. Afficher le details du produit
*/
var con  = require("./MySQL.js"),
    fs = require("fs");

var DetailsProduct = {
    // 1
    page_details : (req, res) =>{
        // get categorie, numero
        var categorie = req.params.categorie_produit,
            titre_numero = req.params.titre_numero,
            numero = titre_numero.substring(titre_numero.lastIndexOf("-")+1),
            titre = titre_numero.substring(0, titre_numero.lastIndexOf("-"));
  
        if(categorie !='chaussures' & categorie !='accessoires'){
            res.redirect("/")
        }else{
            //request
            var R_PRODUCT = `SELECT chemin, nombre_images, titre, prix, p.numero, categorie, genre, type, marque, description, `+
            `status, date, REPLACE(FORMAT(prix, 0), ',', ' ') AS 'prix_format', REPLACE(titre, ' ', '-') AS 'titre_concat' ` + 
            `FROM produit p INNER JOIN images i USING(numero) `
                   
            var RP_SIMILAIRE = `SELECT chemin, titre, prix, p.numero, categorie, genre, type, marque, `+ 
            `status, date, REPLACE(FORMAT(prix, 0), ',', ' ') AS 'prix_format', REPLACE(titre, ' ', '-') AS 'titre_concat' ` + 
            `FROM produit p INNER JOIN images i USING(numero) ` + 
            `WHERE status='en stock' AND numero !=? AND categorie=? AND MATCH(titre) AGAINST(?) LIMIT 0, 10`  
            

            var data = fs.readFileSync("./backend-modules/p.js", "utf-8");
            var p = JSON.parse(data);

            var product = [],
            products_sim = [];
            p.forEach((list) =>{
                if(list.numero == numero){
                    product.push(list);
                }

                if(list.categorie == categorie){
                    products_sim.push(list)
                }
            })

            if(product.length !=1){
                res.redirect(url_from)
            }else{
                res.render("details_product.html", {
                    categorie: categorie,
                    numero: numero,
                    titre_numero:titre_numero,
                    product: product[0],
                    sim_products: products_sim.slice(0, 10)
                });      
            }
        
            // var R = R_PRODUCT + ";" + RP_SIMILAIRE; 
            // con.query(R, [numero, numero, categorie, titre], (err, rs) =>{
            //     var url_from = req.headers.referer;
            //     if(err){
            //         res.redirect(url_from)
            //     }else{
            //         // get product
            //         var product = rs[0];

            //         var d = JSON.stringify(product);
            //         fs.writeFileSync("./backend-modules/p.js", d)

            //         var sim_products = rs[1];

            //         if(product.length !=1){
            //             res.redirect(url_from)
            //         }else{
            //             res.render("details_product.html", {
            //                 categorie: categorie,
            //                 numero: numero,
            //                 titre_numero:titre_numero,
            //                 product: product[0],
            //                 sim_products: sim_products
            //             });      
            //         }
            //    }
            // })
        }    
    }
}

module.exports =DetailsProduct;