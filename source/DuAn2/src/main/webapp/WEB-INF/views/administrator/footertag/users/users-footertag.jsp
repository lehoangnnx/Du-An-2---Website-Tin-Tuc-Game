<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript"
	src="${contextPath}/js/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/tether/js/tether.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/bootstrap4/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/detectmobilebrowser/detectmobilebrowser.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/jscrollpane/jquery.mousewheel.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/jscrollpane/mwheelIntent.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/jscrollpane/jquery.jscrollpane.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/jquery-fullscreen-plugin/jquery.fullscreen-min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/waves/waves.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/switchery/dists/switchery.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/DataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/DataTables/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/DataTables/Responsive/js/dataTables.responsive.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/DataTables/Responsive/js/responsive.bootstrap4.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/DataTables/Buttons/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/DataTables/Buttons/js/buttons.bootstrap4.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/DataTables/JSZip/jszip.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/DataTables/pdfmake/build/pdfmake.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/DataTables/pdfmake/build/vfs_fonts.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/DataTables/Buttons/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/DataTables/Buttons/js/buttons.print.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/DataTables/Buttons/js/buttons.colVis.min.js"></script>

<!-- Neptune JS -->
<script type="text/javascript" src="${contextPath}/js/js/app.js"></script>
<script type="text/javascript" src="${contextPath}/js/js/demo.js"></script>
<script type="text/javascript" src="${contextPath}/js/js/tables-datatable.js"></script>

<script type="text/javascript" src="${contextPath}/js/sweetalert2/sweetalert2.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/js/ui-notifications.js"></script>
<!-- Check All Checkbox Table Users -->
<script type="text/javascript">
    $('#allcb').change(function() {
        $("input[type='checkbox'][name='cb']").prop('checked', $(this).prop('checked'));

    });

    var tableControl = document.getElementById('table-3');
    $("input[name='cb']").change(function() {
        console.log($('[name="cb"]'));
        var result = []

        $('input[name=cb]:checked', tableControl).each(function() {
            console.log($(this).val()+"i")
            result.push($(this).val());
            if(result.indexOf('on') == 0){
                result.splice(result.indexOf('on'), 1 );
            }
        });

        $("#arrayId").val(result);
        console.log("ID :" + result);
    });
</script>
<script>
$("#ab").click(function(){
    $.get("${pageContext.request.contextPath}/admin/users1", function(data, status){
        alert("Data: " + data + "\nStatus: " + status);
    });
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
</script>
<script>
	function deleteOne(arrayId){
			$("#arrayId").val(arrayId);
			$("#command").attr("action", "${pageContext.request.contextPath}/admin/users");
		}
	function deleteAll(){
			$("#command").attr("action", "${pageContext.request.contextPath}/admin/users");
	}
</script>
<script>
$(document).ready(function() {
	var msg = $("#msg").val();
	if(msg != "" ){
		alert(msg);
	}
	
	
});
</script>