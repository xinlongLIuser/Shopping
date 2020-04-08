var i=2;
function aa(){
	setInterval(bb,1000);
}

function bb(){

	var img =document.getElementById("img");
	var path = $("#path").val();
	img.src=path+"/images/front/lunbo"+i+".jpg";
	var div=document.getElementsByClassName("lunbo_div1");
	for(var v=0;v<=3;v++){
		div[v].style.background="";
	}
	if(i==1){
		div[0].style.background = 'rgb(241,1,128)';
	}else if(i==2){
		div[1].style.background = 'rgb(241,1,128)';
	}else if(i==3){
		div[2].style.background = 'rgb(241,1,128)';
	}else if(i==4){
		div[3].style.background = 'rgb(241,1,128)';
	}
	if(i==4){
		i=1;
	}else{
		i=i+1;
	}
	
}

