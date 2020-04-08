function jsonToDom($dom,jsonArr,fieldArr){
    $dom.empty();
	$(jsonArr).each(function(i,obj){
		var $tr = $("<tr></tr>");
		$tr.appendTo($dom);
		for(var field of fieldArr){
			var $td  = $("<td>"+obj[field]+"</td>");
			$td.appendTo($tr);
		}
	})
}
function jsonToSelect($select,jsonArr,fieldArr) {
    $select.empty();
    $select.append("<option value=''>请选择</option>>")
	if(fieldArr.length>2){
        var id  =fieldArr[0];
        var text = fieldArr[1];
        $(jsonArr).each(function (i,obj) {
            var $option = $("<option value='"+obj[id]+"'>"+obj[text]+"</option>")
            $option.appendTo($select)
        })
	}else{
		alert("你不给我参数,我怎么帮你设置,嘤嘤嘤")
	}

}

function mergeCells($tbody){
	var $trs = $tbody.find("tr");
	//遍历所有的tr
    $trs.each(function (i,tr) {
    	var $tds = $(tr).find("td")
		// 遍历tr中所有的td
        $tds.each(function(j,td){
        	var value = td.innerHTML;
        	// 比较之后的行相同的列的td
        	var sum = 1;
        	var flag = true;
        	for(var m = i+1;m<$trs.length&&flag;m++){
        		var afterTd = $($trs[m]).find("td")[j]
        		// alert(value+"--"+afterTd.innerHTML)
        		if(value==afterTd.innerHTML){
        			sum++;
        			$(afterTd).hide()
        		}else{
        			flag = false;
        		}
        	}
        	if(sum>1){
        		$(td).attr("rowspan",sum)
        	}
        })
    })
}

function mergeCellsByCol($tbody,col){
	var $trs = $tbody.find("tr");
	//遍历所有的tr
    $trs.each(function (i,tr) {
    	var td = $(tr).find("td")[col]
    	var value = td.innerHTML;
    	// 比较之后的行相同的列的td
    	var sum = 1;
    	var flag = true;
    	for(var m = i+1;m<$trs.length&&flag;m++){
    		var afterTd = $($trs[m]).find("td")[col]
    		// alert(value+"--"+afterTd.innerHTML)
    		if(value==afterTd.innerHTML){
    			sum++;
    			$(afterTd).hide()
    		}else{
    			flag = false;
    		}
    	}
    	if(sum>1){
    		$(td).attr("rowspan",sum)
    	}
    })
}