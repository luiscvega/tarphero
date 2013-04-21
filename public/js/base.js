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
                $("#upload-tips").remove();

                var response = response,
                    image = $.parseJSON(response);

                if (image.orientation == "portrait") {
                  var height = 300, width = height * parseFloat(image.ratio);
                } else {
                  var width = 600, height = width * parseFloat(image.ratio);
                }

                $("#preview").append("<div id='image-preview'><img height='" + height + "' width='" + width + "' src='" + image.url + "'/></div")

                $("#image-section").append(template({ file: file, image: image, ratio: image.ratio, orientation: image.orientation }))

                window.image = image;
                window.file = file;
            });
        }
    });

    var template = Handlebars.compile(
                "<div id='image-details' class='span3' data-ratio='{{ ratio }}' data-orientation='{{ orientation }}'>" +
                  "<div class='tile'>" +
                    "<legend>Image Details</legend>" +
                    "<dl>" +
                      "<dt>File Name<dt>" +
                      "<dd>{{ file.name }}</dd>" +
                      "<dt>Dimensions<dt>" +
                      "<dd>Width: {{ image.width }} pixels</dd>" +
                      "<dd>Height: {{ image.height }} pixels</dd>" +
                      "<dt>Width (ft.)<dt>" +
                      "<dd>" +
                        "<input id='image_width' name='job[width]' type='number' class='span4' />" +
                      "</dd>" +
                      "<dt>Height (ft.)<dt>" +
                      "<dd>" +
                        "<input id='image_height' name='job[height]' type='number' class='span4' />" +
                      "</dd>" +
                    "</dl>" +
                  "</div>" +
                "</div>")

    $(document).on("keyup", "#image_width", function(e) {
        var $target = $(e.target), val = $target.val(),
            orientation = $("#image-details").data("orientation"),
            ratio = $("#image-details").data("ratio");

        if ($target.attr("id") == "image_width") {
            $("#image_height").val(val / ratio);
        } else {
            $("#image_width").val(val / ratio);
        }
    });

    $(document).on("keyup", "#image_height", function(e) {
        console.log("hey");
        var $target = $(e.target), val = $target.val(),
            orientation = $("#image-details").data("orientation"),
            ratio = $("#image-details").data("ratio");

        if ($target.attr("id") == "image_width") {
            $("#image_height").val(val * ratio);
        } else {
            $("#image_width").val(val * ratio);
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
