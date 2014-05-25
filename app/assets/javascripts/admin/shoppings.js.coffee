jQuery ->
	if $('body').data('controller-name') in ['shoppings']
		$(".chosen-select").chosen()