$(function () {
	bool = false
	var start
	var start_id
	var end_id

	$(":not(.selectable").mousedown(function () {
		$(".selectable").removeClass("selected")
	})
	$(".selectable").mousedown(function (event) {
		event.stopPropagation()
		start_id = $(this).closest(".selectable").attr("id").split("-")[1]
		end_id = start_id
		start = this
		$(this).closest(".selectable").addClass("selected")
		bool = true
	})
	$(document).mouseup(function () {
		bool = false
		if (start_id == end_id) {
			console.log($(start).attr("class"))
		} else {
			console.log("multiple")
		}
	})
	$(".selectable .half").mouseenter(function () {
		if (bool) {
			end_id = $(this).closest(".selectable").attr("id").split("-")[1]
			$(".selectable").removeClass("selected")
			for (
				let id = Math.min(start_id, end_id);
				id < Math.max(start_id, end_id) + 1;
				id++
			) {
				$("#day-" + id).addClass("selected")
			}
		}
	})
})
