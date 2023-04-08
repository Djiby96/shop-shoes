/*
   1. Open file interface

   2. Ecrire le nombre de photos choisies

   3. Ajouter le type de chaussures ou accessoires dans la form

*/

var button_img = document.getElementById("button_img"),
    input_file = document.getElementById("input_file"),
    text_imgs = document.getElementById("text_imgs");
    text_imgs_select = document.getElementById("text_imgs_select");

// 1
button_img.addEventListener("click", () =>{
    input_file.click();
})

// 2
input_file.addEventListener("change", () =>{
    var files = input_file.files
    if(files.length >= 1){
        text_imgs_select.textContent = `${files.length} photos choisies`
    }else{
        text_imgs_select.textContent = `Aucune photos choisies`
    }
})

// 3
var categorie_vente = document.getElementById("categorie_vente"),
    categorie_personne = document.getElementById("categorie_personne");
    container_type = document.getElementById("container_type"),
    type_chaussures = document.getElementById("type_chaussures"),
    type_accessoires = document.getElementById("type_accessoires");

[categorie_vente, categorie_personne].forEach((categorie) =>{
    categorie.addEventListener("change", () =>{
        var x = categorie_vente.value,
            y = categorie_personne.value;
    
        var container_type_child = container_type.firstElementChild;
        if(container_type_child){
            container_type.removeChild(container_type_child)
        }
    
        if(x == "chaussures" && (y=="homme" || y=="femme" || y=="homme-femme")){
            container_type.appendChild(type_chaussures)
        }else if(x == "accessoires" && (y=="homme" || y=="femme" || y=="homme-femme")){
            container_type.appendChild(type_accessoires)
        }else{
            // nothing to do
        }
            
    })    
})
