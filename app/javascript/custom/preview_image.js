function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();            
      reader.onload = function (e) {
          $(document.getElementById(input.id + "_medium")).attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$(".photo_upload").change(function(){
    readURL(this);
});