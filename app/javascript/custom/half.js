$(function () {
	$(".half:not('.empty')").hover(
		function () {
			$(this).addClass("hover").siblings().addClass("not-hover")
		},
		function () {
			$(".half").removeClass("hover").removeClass("not-hover")
		}
	)
})
