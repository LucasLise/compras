$(document).on("turbolinks:load", function(){
  $('.editar_comentario').click(function(){
    $('#comentario_descricao').val('aasdas').focus();
  });

  $('.imagem_miniatura').click(function(){
      var src = this.src
      src = src.replace("thumb", "medium")
      $('#imagem_principal').attr("src", src)
  });

  $('#imagem_principal').mouseover(function(){
    $(".zoom").elevateZoom({
        zoomType				: "lens",
        lensShape : "round",
        lensSize    : 200
    });
  });
});
