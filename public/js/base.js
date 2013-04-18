$(function() {
    $("#image-upload").ajaxForm({
        dataType: "json", 

        success: function(data) {
          console.log(data);

          window.stuff = data;
          var images = data.images;

          window.images = images;
        }
    });
});
