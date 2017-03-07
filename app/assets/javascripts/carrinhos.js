$(document).on("turbolinks:load", function(){
  $('.quantidade').change(function(){
    alert('1231')
    var quantidade_atual = $(this).val();
    var id_item = $(this).closest('tr').find('td[data-item]').data('item');
    $('#carrinho').load('/carrinhos?quantidade_atual=' + quantidade_atual + '&id_item=' + id_item +' #carrinho');
  });
});
