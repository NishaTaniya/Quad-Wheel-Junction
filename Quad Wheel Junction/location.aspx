<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="location.aspx.cs" Inherits="Quad_Wheel_Junction.location" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Location</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script>
        function begin() {
            //alert("Hello");
            var r = confirm("Do you want to change your location ?");
            if (r == true) {
                //alert("You have clicked ok");
                getLocation();
            } else {
                window.location.replace("UserHomePage.aspx");
            }
        }

        function getLocation() {
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
                            document.getElementById("txtlocation").value = address.results[0].formatted_address;
                           // for (i = 0; i < address.length; i++) {
                           //     console.log(address.results[i].formatted_address);
                            //}

                            //set.value=address.results[0].formatted_address
                        }
                    };
                    xhttp.open("GET", "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + lat + "," + long + "&key=AIzaSyARWYMIkm5Kof91vHH-A4zx1WmsIzhpeNY", true);
                    xhttp.send();
                }

            
        }
    </script>
</head>
<body onload="begin()">
    <form id="form1" runat="server">
        <div style="width:40%;margin:auto;padding:20px;margin-top:100px;border:2px solid black;border-radius:5px;font-size:18px">
            Your Location that we have fetched : <br />
            <br />
            <asp:TextBox ID="txtlocation" class="form-control" placeholder="Enter Location" runat="server" TextMode="MultiLine" Rows="3" Width="100%" /><br />

            <asp:Button Text="OK" class="btn btn-dark" runat="server" OnClick="OK_Click" />
            <br />
            <br />
            <b>Note :</b> If you are not satisfied with our result then Please Enter your location manually...
        </div>
    </form>
</body>
</html>
