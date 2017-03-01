$(document).on("turbolinks:load", function(){
  $('.quantidade').click(function(){
    var quantidade_atual = $(this).val();
    var id_item = $(this).closest('tr').find('td[data-item]').data('item');
    $('#carrinho').load('/carrinhos?quantidade_atual=' + quantidade_atual + ' #carrinho')
  });
});
