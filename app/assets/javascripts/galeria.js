$(document).on("turbolinks:load", function(){
  $('#ordenacao').change(function(){
    var ordem = $('#ordenacao').val();
    $('#produtos').load('/galeria?ordem=' + ordem + ' #produtos');
  });


  $('.categorias').click(function(){
    var buscar = $(this).text();
    $('#produtos').load('/galeria?buscar=' + buscar + ' #produtos');
  });

});
