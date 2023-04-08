/*

    1. Affichage des types chaussures et accessoires en fonction du chemin URL(chaussures ou accessoires)

    2. Modifier l'URL pour le genre selectionner

    3. Modifier l'URL pour le prix selectionner

    4. Modifier l'URL pour le type de chaussures ou accessoires selectionner

    5. Selectionner le genre correspondant s'il existe dans l'url au chargement de la page

    6. Selectionner le prix correspondant s'il existe dans l'url au chargement de la page

    7. Selectionner le type chaussures ou accessoires correspondant s'il existe dans l'url au chargement de la page
*/

// 1
var stc = document.getElementById("stc"),
    sta = document.getElementById("sta");

var check_chaussures = URLQueryString.checkStringOnUrl("chaussures");  
if(check_chaussures){
    stc.style.setProperty("display", "block", "important")
}else{
    sta.style.setProperty("display", "block", "important")
}  

// 2
var sg = document.getElementById("sg");
sg.addEventListener("change", () =>{
    var sg_value = sg.value;
    if(sg_value){
        var URL_REDIRECT = URLQueryString.changeURLParameters("genre", sg_value)
    }else{
        var URL_REDIRECT = URLQueryString.deleteParameter("genre")
    }

    window.location.href = URL_REDIRECT; 
})

// 3
var sp = document.getElementById("sp");
sp.addEventListener("change", () =>{
    var sp_value = sp.value;
    if(sp_value){
        var URL_REDIRECT = URLQueryString.changeURLParameters("prix", sp_value)
    }else{
        var URL_REDIRECT = URLQueryString.deleteParameter("prix")
    }

    window.location.href = URL_REDIRECT; 
})

//4 
var type_select = [stc, sta];
for(let i=0; i<type_select.length; i++){
    type_select[i].addEventListener("change", () =>{
        var value = type_select[i].value;
        if(value){
            var URL_REDIRECT = URLQueryString.changeURLParameters("type", value)
        }else{
            var URL_REDIRECT = URLQueryString.deleteParameter("type")
        }
    
        window.location.href = URL_REDIRECT; 
    })
}

// 5
var check_genre_query = URLQueryString.checkParameter("genre");
if(check_genre_query){
    // cacher d'abord le type chaussures et accessoires si genre='enfant-bebe'
    if(check_genre_query == 'enfant-bebe'){
        stc.style.display='none';
        sta.style.display='none';
    }

    var options = sg.children;
    var selected = document.createAttribute("selected");
    for(let i=0; i<options.length; i++){
        var sg_value = options[i].getAttribute("value");
        if(sg_value == check_genre_query){
            options[i].setAttributeNode(selected);
        }
    }
}

// 6
var check_prix_query = URLQueryString.checkParameter("prix");
if(check_prix_query){
    var options = sp.children;
    var selected = document.createAttribute("selected");
    for(let i=0; i<options.length; i++){
        var sp_value = options[i].getAttribute("value");
        if(sp_value == check_prix_query){
            options[i].setAttributeNode(selected);
        }
    }
}

// 7
var type_parameter = URLQueryString.checkParameter("type");
if(type_parameter){
    var check_is_categorie_is_chaussures = URLQueryString.checkStringOnUrl("chaussures");
    if(check_is_categorie_is_chaussures){
        var options = stc.children;
        var selected = document.createAttribute("selected");
        for(let i=0; i<options.length; i++){
            var stc_value = options[i].getAttribute("value");
            if(stc_value == type_parameter){
                options[i].setAttributeNode(selected);
            }
        }
    }else{
        var options = sta.children;
        var selected = document.createAttribute("selected");
        for(let i=0; i<options.length; i++){
            var sta_value = options[i].getAttribute("value");
            if(sta_value == type_parameter){
                options[i].setAttributeNode(selected);
            }
        }
    }
}