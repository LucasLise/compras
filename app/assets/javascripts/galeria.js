$(document).on("turbolinks:load", function(){
  $('#ordenacao').change(function(){
    var ordem = $('#ordenacao').val();
    $('#produtos').load('/galeria?ordem=' + ordem + ' #produtos');
  });

  $('#categorias').change(function(){
    var buscar = $('#categorias').val();
    $('#produtos').load('/galeria?buscar=' + buscar + ' #produtos');
  });

});
