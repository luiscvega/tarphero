$(function() {
    $("#image-upload").ajaxForm({
        dataType: "json",

        beforeSubmit: function() {
            $("#upload-multiple").toggleClass("uploading");
        },

        success: function(data) {
            var images = data.images;

            $("#upload-multiple").toggleClass("uploading");

            $("#customize-product").append(
                "<img src='" + images[0].url + "' />"
            );
        }
    });

  Dropzone.options.myAwesomeDropzone = {
    paramName: "images[]"
  };
});
