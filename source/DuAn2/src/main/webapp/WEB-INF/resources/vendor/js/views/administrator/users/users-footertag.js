
    $('#allcb').change(function() {
        $("input[type='checkbox'][name='cb']").prop('checked', $(this).prop('checked'));

    });

    var tableControl = document.getElementById('table-3');
    $("input[name='cb']").change(function() {

        var result = []

        $('input[name=cb]:checked', tableControl).each(function() {

            result.push($(this).val());
            if(result.indexOf('on') == 0){
                result.splice(result.indexOf('on'), 1 );
            }
        });

        $("#arrayId").val(result);

    });


function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}

	function deleteOne(arrayId){
			$("#arrayId").val(arrayId);
			$("#command").attr("action", contextPath+"/admin/users");
		}
	function deleteAll(){
			$("#command").attr("action", contextPath+"/admin/users");
	}

$(document).ready(function() {
	var msg = $("#msg").val();
	if(msg != "" ){
		alert(msg);
	}
	
	
});
