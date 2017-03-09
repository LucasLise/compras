$(document).on("turbolinks:load", function(){
  $("#endereco_unidade_federativa").select2({
       placeholder: "Selecione..."
   });

   $("#municipio_unidade_federativa").select2({
        placeholder: "Selecione..."
    });
});
