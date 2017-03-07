$(document).on("turbolinks:load", function(){
  $('#recentes').change(function(){
    var ordem = $('#recentes').val();
    $('#todos_pedidos').load('/pedidos/todos_pedidos?ordem=' + ordem + ' #todos_pedidos');
  });
});
