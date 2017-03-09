$(document).ready(function aplicaMascaras() {

  $inputs = $(".mask").not(".inputmask-installed");

  $inputs.filter(".cpf").inputmask("999.999.999-99", {'removeMaskOnSubmit': true});
  $inputs.filter(".cep").inputmask("99999-999");
});
