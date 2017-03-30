$(document).on("turbolinks:load", function(){
  $('.editar_comentario').click(function(){
    $('#comentario_descricao').val('aasdas').focus();
  });

  $('.imagem_miniatura').click(function(){
      var src = this.src;
      $('#imagem_principal').attr("src", src);
  });

  $("#imagem_principal").elevateZoom({scrollZoom : true});

  $("#produto_categoria_id").select2({
       placeholder: "Selecione..."
  });

  $("#produto_marca_id").select2({
    placeholder: "Selecione..."
  });
});
