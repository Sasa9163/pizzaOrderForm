$(function () {
  $('.btn_submit').click(function () {

	var index=this.dataset['index'];
	var str='#order_form'+index;

	if (! $(str)[0].checkValidity()) {
          return;
        }

    var formData = $(str).serialize();

      $.ajax({
          url: "ShoppingCartServlet",
          type: "POST",
          data:  formData,
			success:(function(){
				swal("追加しました","カートに追加されました。","success").then(function(){
					$(str)[0].reset();
					$(str).removeClass("was-validated");
				});
			})

			/*,
			error:(function(){
				swal("エラー","カートへの追加ができませんでした。\nエラー内容を確認してください。","error");
			})*/
      });
  });
});