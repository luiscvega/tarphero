$(function() {
    Dropzone.autoDiscover = false;

    $("#dropzone").dropzone({
        url: "/images",
        paramName: "image",
        previewsContainer: ".thing",
        accept: function(file, done) {
            var count = $(".thing").children().length;

            if (count > 1) {
                done("You can only upload one image per job.");
            } else {
                done();
            }
        },
        init: function() {
            this.on("success", function(image, response) {
                $("#dropzone").remove();
                var response = response,
                    image = $.parseJSON(response);

            });
        }
    });

    //$("#image-upload").ajaxForm({
        //dataType: "json",

        //beforeSubmit: function() {
            //$("#upload-multiple").toggleClass("uploading");
        //},

        //success: function(data) {
            //var images = data.images;

            //$("#upload-multiple").toggleClass("uploading");

            //$("#customize-product").append(
                //"<img src='" + images[0].url + "' />"
            //);
        //}
    //});

});
