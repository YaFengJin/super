/**
 * ${pageContext.request.contextPath}/Person/
 */
$(function() {
    $("#save").click(function() {
        $.ajax({
            url:"/savebank",
            type:"post",
            data:$("#form").serialize(),
            dataType:"json",
            success:function(data){
                alert(data.message);
                location.reload();
            }
        });
    });
});