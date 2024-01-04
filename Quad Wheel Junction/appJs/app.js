(function () {
    navigator.geolocation.getCurrentPosition(function (position) {
        getUserAddressBy(position.coords.latitude, position.coords.longitude)
    },
        function (error) {
            console.log("The Locator was denied :(")
        })

    function getUserAddressBy(lat, long) {
        var set = document.getElementById("autocomplete");
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var address = JSON.parse(this.responseText)
                for (i = 0; i < address.length; i++) {
                    console.log(address.results[i].formatted_address);
                }
                
                //set.value=address.results[0].formatted_address
            }
        };
        xhttp.open("GET", "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + lat + "," + long + "&key=AIzaSyARWYMIkm5Kof91vHH-A4zx1WmsIzhpeNY", true);
        xhttp.send();
    }

})();