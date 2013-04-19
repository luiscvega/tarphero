$(function() {
    $("#image-upload").ajaxForm({
        dataType: "json", 

        success: function(data) {
          var images = data.images;
        }
    });
});
