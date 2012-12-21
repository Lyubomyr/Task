(function($) {
    $.fn.formToWizard = function(options) {
        options = $.extend({
            submitButton: ""
        }, options);

        var element = this;

        var steps = $(element).find("fieldset.steps");
        var count = steps.size();
        var submmitButtonName = "#" + options.submitButton;
        $(submmitButtonName).hide();

        // 2
        $(element).before("<ul id='steps'></ul>");

        steps.each(function(i) {
            $(this).wrap("<div id='step" + i + "'></div>");
            $(this).append("<p id='step" + i + "commands'></p>");

            // 2
            var name = $(this).find("legend").html();
            $("#steps").append("<li id='stepDesc" + i + "'>Шаг " + (i + 1) + "<span>" + name + "</span></li>");

            if (i == 0) {
                createNextButton(i);
                selectStep(i);
            }
            else if (i == count - 1) {
                $("#step" + i).hide();
                createPrevButton(i);
            }
            else {
                $("#step" + i).hide();
                createPrevButton(i);
                createNextButton(i);
            }

        });

        function createPrevButton(i) {
            var stepName = "step" + i;
            $("#" + stepName + "commands").append("<a href='#' id='" + stepName + "Prev' class='prev'>< Назад</a>");

            $("#" + stepName + "Prev").bind("click", function(e) {
                $("#" + stepName).hide();
                $("#step" + (i - 1)).show();
                $(submmitButtonName).hide();
                selectStep(i - 1);
            });
        }

        function createNextButton(i) {
            var stepName = "step" + i;
            $("#" + stepName + "commands").append("<a href='#' id='" + stepName + "Next' class='next'>Вперед ></a>");
	  if (valid(i)){
            $("#" + stepName + "Next").bind("click", function(e) {
                $("#" + stepName).hide();
                $("#step" + (i + 1)).show();
                if (i + 2 == count)
                    $(submmitButtonName).show();
		selectStep(i + 1);
            });
	  }
        }

        function selectStep(i) {
	switch (i){
		case 0:
			$('div#frame_types').show();
			$('div#picture').hide();
			break;
		case 1:
			$('div#frame_types').hide();
			$('div#picture').show();
			break;
		case 2:
			$('div#frame_types').hide();
			$('div#picture').hide();
		}

            $("#steps li").removeClass("current");
            $("#stepDesc" + i).addClass("current");
	//grab price ----------------------------------------
            $('#picture_order_price').attr('value', parseInt($('#price').text()));
        }

	//validation--------------------------
	function valid(i) {
	    	if (i == 1 && $("input.file").attr("name")){

			return true; }
		else{
			return true;
		}
	}
    }
})(jQuery); 
