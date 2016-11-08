var xmlhttp = new XMLHttpRequest();
var url = "https://restcountries.eu/rest/v1/all"; 

xmlhttp.onreadystatechange = function(){
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
        myFunction(xmlhttp.responseText);
    }
}
xmlhttp.open("GET", url, true);
xmlhttp.send();

function myFunction(response){
    var arr = JSON.parse(response);
    var i;
    var option;
    var x = document.getElementById("pais");
    var textToFind = 'Mexico';
    for(i = 0; i < arr.length; i++){
        option = document.createElement("option");
        option.text = arr[i].name;
        x.add(option);
    }
    for (i = 0; i< x.options.length; i++){
        if(x.options[i].text == textToFind){
            x.selectedIndex = i;
            break;
        }
    }
}
