$(document).on("turbolinks:load", function() {
    $('#ordenacao').change(function() {
        var ordem = $('#ordenacao').val();
        $('#produtos').load('/galeria?ordem=' + ordem + ' #produtos');
    });


    $('.categorias').click(function() {
        var buscar_categoria = $(this).data().id;
        buscarProdutos('categoria', buscar_categoria)
    });

    $('.marcas').click(function() {
        var buscar_marca = $(this).data().id;
        buscarProdutos('marca', buscar_marca)
    });

    function buscarProdutos(tipo, id){
      if (tipo == 'marca'){
        $('#produtos').load('/galeria?buscar_marca=' + id + ' #produtos');
      }else{
        $('#produtos').load('/galeria?buscar_categoria=' + id + ' #produtos');
      }
    }

    function atualizaAlturaPanels() {
        var alturaJanela = $(window).height();
        var alturaBotoes = $(".botoes-conciliacao").innerHeight();
        $.each([instance.$panelMovimento, instance.$panelExtrato], function(index, panel) {
            var $panel = $(panel);
            if ($panel.length) {
                var panelTop = $panel.position().top + $panel.find(".wscrollable").position().top;
                var margemIbox = parseInt($panel.find(".ibox").css("margin-bottom"), 10);
                var alturaRodapePanel = 30;
                var alturaRodapePagina = $(".footer").height();
                var margemScrollable = parseInt($panel.find(".wscrollable").css("margin-bottom"), 10);
                $panel.find(".wscrollable").css("height", alturaJanela - panelTop - margemScrollable - margemIbox - alturaRodapePanel - alturaBotoes - alturaRodapePagina);
            }
        });
    }
});
