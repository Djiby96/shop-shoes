// NODE and NPM MODULES
var express = require("express"),
    path = require("path"),
    ejs = require("ejs"),
    bodyParser = require('body-parser'),
    cookieParser = require("cookie-parser"),
    multer = require("multer"),
    cookieSession = require("cookie-session"),
    connectFlash = require("connect-flash");

// Init module
var multerOption = multer();
var app = express();
 
// Init app to render html file
app.set('view engine', 'html');
app.engine('html', ejs.renderFile);

// Init app to use body-parser, cookie-parser and flash
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser("chaussures_accessoires"));
app.use(cookieSession({name: "chaussures-accessoires", keys: ["chaussures_accessoires"]}));
app.use(connectFlash());

// Init app to use static-folder
app.use(express.static(path.join(__dirname , "css")))
app.use(express.static(path.join(__dirname , "views")))
app.use(express.static(path.join(__dirname , "images")))
app.use(express.static(path.join(__dirname , "js")))
app.use(express.static(__dirname)) 

// Init app port
var port = process.env.PORT || 44444;
app.listen(port, () => console.log(`APP SHOP-SHOES RUNNING ON PORT ${port}`))

// Export backend-modules for app
var Accueil = require("./backend-modules/accueil.js"),
    AdminConnect = require("./backend-modules/connexion_admin.js"),
    DetailsProduct = require("./backend-modules/details_products.js"),
    ShoesAccessory = require("./backend-modules/ShoesAccessory.js"),
    AddProduct = require("./backend-modules/add_product.js"),
    Products = require("./backend-modules/produits.js"),
    AnciensProduits = require("./backend-modules/anciens_produits.js"),
    flashMessage = require("./backend-modules/flashMessage.js");

//use message flash
app.use(flashMessage.message) 

// get method from client
app.get("/", Accueil.page_accueil)

app.get("/connexion-admin", AdminConnect.page_connexion_admin)

app.get("/espace-admin/ajouter-produit", AddProduct.page_ajouter_produit)

app.get("/espace-admin/produits", Products.page_produits)

app.get("/espace-admin/anciens-produits", AnciensProduits.page_anciens_produits)

app.get("/espace-admin/produits/disable-produit-:numero", Products.disable_product)

app.get("/:categorie_produit", ShoesAccessory.page_chaussures_accessoires)

app.get("/:categorie_produit/:titre_numero", DetailsProduct.page_details)


// post method
app.post("/connexion-admin", AdminConnect.admin_connexion_verify)

app.post("/espace-admin/ajouter-produit", multerOption.any(), AddProduct.addProduct)