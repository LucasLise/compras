$(document).on("turbolinks:load", function(){
  $('.quantidade').click(function(){
    var quantidade_atual = $('.quantidade').val();
    //var id_item = $('#id_item').val();
    $('#carrinho').load('/carrinhos?quantidade_atual=' + quantidade_atual + ' #carrinho')
  });
});
