function countStart(nowTime,closeTime){
  

  		//시간계산
	var nowTime = new Date(nowTime);	//현재시간
	var closeTime = new Date(closeTime);	//파라미터
	
	var elapsedMSec = closeTime.getTime() - nowTime.getTime();
	
	
	count(elapsedMSec);
}


function count(elapsedMSec){
	var interval;
	
		var _second = 1000;
		var _minute = _second * 60;
		var _hour = _minute * 60;

		var hour = Math.floor(elapsedMSec / _hour);
		var min = Math.floor((elapsedMSec % _hour) / _minute);
		var sec = Math.floor((elapsedMSec % _minute) / _second);
    interval = setInterval(function(){
        var el = document.querySelector('#countdown');
        if ( sec==0){
            if(min ==0){
                if(hour ==0){
                    el.innerHTML = 'TIME OUT';
                    location.href='/board/timeoutAction';
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