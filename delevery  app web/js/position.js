// Initialize and add the map
function initMap() {
    
    
    var LocationsForMap = [
        ['Livreur',3.840497, 11.489223],
          ['lieu de depart',3.829757, 11.492660],
      ["Lieu d'arrivé", 3.857710, 11.501145],
      
    ];
   
    // The map, centered at Uluru
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 13,
      center: new google.maps.LatLng(3.840497, 11.489223),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    var infowindow = new google.maps.InfoWindow();

    var marker, i;
    // The marker, positioned at Uluru
    for (i = 0; i < LocationsForMap.length; i++) {  
        marker = new google.maps.Marker({
          position: new google.maps.LatLng(LocationsForMap[i][1], LocationsForMap[i][2]),
          map: map
        });
  
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
          return function() {
            infowindow.setContent(LocationsForMap[i][0]);
            infowindow.open(map, marker);
          }
        })(marker, i));
      }
  }