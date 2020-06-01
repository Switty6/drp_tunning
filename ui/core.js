
$(document).ready(function(){

    window.addEventListener('message',function(event) {
        var data = event.data;
        if (data.type === 'show') {
            if (data.bool == true){
                document.getElementById("lolz").style.display = 'block';
               alert('lol')

            }else if (data.bool == false){
                document.getElementById("lolz").style.display = 'none';
            }
        }
        else if (data.type ==='timer'){
            var timer = data.timer;
            $("#dayumn").text(timer);
        } 

    })
    
    document.onkeyup = function (data){
        if (data.which == 27 ){
            $.post('http://drp_tunning/exit', JSON.stringify({}));
            return
        }
        
    };

    $('.Timerbtn').click(function(){
        $.post('http://drp_tunning/timerstart', JSON.stringify({}));
            return
    })
    $('.stage1').click(function(){
        $.post('http://drp_tunning/stage', JSON.stringify({

            stage : 1})

        );
            return
    })
    $('.stage2').click(function(){
        $.post('http://drp_tunning/stage', JSON.stringify({

            stage : 2})

        );
            return
    })
    $('.stage3').click(function(){
        $.post('http://drp_tunning/stage', JSON.stringify({

            stage : 3})

        );
            return
    })
})