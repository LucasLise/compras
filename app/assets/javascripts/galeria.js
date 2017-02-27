$(document).on("turbolinks:load", function(){
  $('#ordenacao').change(function(){
    var ordem = $('#ordenacao').val();
    $('#produtos').load('/galeria?ordem=' + ordem + ' #produtos');
  });


  $('.categorias').click(function(){
    //alert('asdas');
    //$(this).fadeOut('slow');
    //var buscar = $(this).val();
    alert($(this).val());

    alert(buscar);
    $('#produtos').load('/galeria?buscar=' + buscar + ' #produtos');
  });

});
