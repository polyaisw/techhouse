function countStart(prod_seq){
    count('countdown');
    
	document.myForm.action = '/board/PostProductAction?prod_seq='+prod_seq;
	document.myForm.submit();

}


function count(cd){

	var interval;
	var hour = prompt('게시하실 시간(hour)을 입력하세요');
	var sec = 0;
	var min = 0;


    interval = setInterval(function(){
        var el = document.getElementById(cd);
        if ( sec==0){
            if(min ==0){
                if(hour ==0){
                    el.innerHTML = 'TIME OUT';
                    clearInterval(interval);
                    return;
                }else{
                    hour--;
                    min = 59;
                    sec=59;
                }
            }else{
                min--;
                sec=59;
            }
        }else{
            sec--;
        }
        if(hour > 0){
        	if(hour < 10){
             var hour_text = '0'+hour+': ';
        	}else{
            var hour_text = hour+': ';
        	}
        }else{
            var hour_text = '00: ';
        }
        if(min > 0 ){
        	if(min < 10){
             var min_text = '0'+min+': ';
        	}else{
            var min_text = min+': ';
        	}
        }else{
            var min_text = '00: ';
        }
        if(sec > 0 ){
        	if(sec < 10){
             var sec_text = '0'+sec;
        	}else{
            var sec_text = sec;
        	}
        }else{
            var sec_text = '00 ';
        }
        el.innerHTML = hour_text + min_text + sec_text;
    },1000)}