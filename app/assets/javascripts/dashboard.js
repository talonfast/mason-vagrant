update();
setInterval(update, 5000);

var monthNames = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
];

function formatAMPM(date) {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return strTime;
}

function update(){
    $.getJSON("/api/read").done(function (json) {
        $("#wl").text(json.water_level + " cm");
        $("#wt").html(json.water_temp + "&deg;");
        $("#at").html(json.air_temp + "&deg;");
        $("#h").text(json.humidity + "%");
        var time = new Date(json.time);
        $("#time").text(
            'Last update: ' +
            formatAMPM(time) + ', ' +
            monthNames[time.getMonth()] + ' ' +
            time.getDate() + ', ' +
            time.getFullYear());

        if(json.up){
            $("div.error").css("display", "none");
        }
        else{
            $("div.error").css("display", "block");
        }
    });
}