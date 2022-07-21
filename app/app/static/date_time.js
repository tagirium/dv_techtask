function timer(){
    let currentTime = new Date();
    let hours = currentTime.getHours();
    let minutes = currentTime.getMinutes();
    let sec = currentTime.getSeconds();
    let t_str;
    if (minutes < 10){
        minutes = "0" + minutes;
    }
    if (sec < 10){
        sec = "0" + sec;
    }
    t_str = "Hello world! Time is: " + hours + ":" + minutes + ":" + sec + " ";
    if(hours > 11){
        t_str += "PM";
    } else {
       t_str += "AM";
    }
     document.getElementById("time_span").innerHTML = t_str;
     setTimeout(timer,1000);
}