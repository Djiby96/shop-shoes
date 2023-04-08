/*
    1. Afficher chaque petit images cliquees

*/

// 1
var imgs_dt = document.querySelectorAll(".imgs_dt"),
    img_dt = document.getElementById("img_dt"),
    container_img = document.getElementById("container_img")
 
for(let i=0; i<imgs_dt.length; i++){
    imgs_dt[i].addEventListener("click", () =>{
        var src = imgs_dt[i].getAttribute("src")
        img_dt.setAttribute("src", src)
        container_img.style.backgroundImage = `url(${src})`
    })
}    