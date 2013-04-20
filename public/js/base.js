$(function() {
    Dropzone.autoDiscover = false;

    $("#dropzone").dropzone({
        url: "/images",
        paramName: "image",
        accept: function(file, done) {
            var count = $("#dropzone").children(".preview").length;

            if (count > 1) {
                done("You can only upload one image per job.");
            } else {
                done();
            }
        },
        init: function() {
            this.on("success", function(file, response) {
                $("#dropzone").remove();

                var response = response,
                    image = $.parseJSON(response);

                if (image.orientation == "portrait") {
                  var width = 150, height = 300;
                } else {
                  var width = 600, height = 300;
                }

                $("#preview").append("<img height='" + height + "' width='" + width + "' src='" + image.url + "'/>")

                window.image = image;
                window.file = file;

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
