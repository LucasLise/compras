$(document).on("turbolinks:load", function(){
  $('#ordenacao').change(function(){
    var ordem = $('#ordenacao').val();
    $('#produtos').load('/galeria?ordem=' + ordem + ' #produtos');
  });


  $('.categorias').click(function(){
    var buscar_categoria = $(this).text();
    $('#produtos').load('/galeria?buscar_categoria=' + buscar_categoria + ' #produtos');
  });

  $('.marcas').click(function(){
    var buscar_marca = $(this).data().id;
    $('#produtos').load('/galeria?buscar_marca=' + buscar_marca + ' #produtos');
  });

});
