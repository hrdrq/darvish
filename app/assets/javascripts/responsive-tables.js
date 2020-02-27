$(document).ready(function() {
  var switched = false;
  var updateTables = function() {
    if (($(window).width() < 767) && !switched ){
      switched = true;
      $("table.responsive").each(function(i, element) {
        splitTable($(element));
      });
      return true;
    }
    else if (switched && ($(window).width() > 767)) {
      switched = false;
      $("table.responsive").each(function(i, element) {
        unsplitTable($(element));
      });
    }
  };
   
  $(window).load(updateTables);
  $(window).on("redraw",function(){switched=false;updateTables();}); // An event to listen for
  $(window).on("resize", updateTables);
   
	
	function splitTable(original)
	{
		original.wrap("<div class='table-wrapper' />");
		
		var copy = original.clone();
		//copy.find("td:not(:first-child), th:not(:first-child)").css("display", "none");
    var fixed_cols = parseInt(original.data("fixed-cols") || 1); //eric
    var pinned_width=0;
    original.find("th:nth-child(-n+"+fixed_cols+")").each(function(i, element) {
      pinned_width+=$(element).outerWidth(true)+4;
      //console.log("width+="+parseInt($(element).outerWidth(true)));
    });
    //console.log("pinned_width="+pinned_width);
    copy.find("td:not(:nth-child(-n+"+fixed_cols+")), th:not(:nth-child(-n+"+fixed_cols+"))").css("display", "none");
		copy.removeClass("responsive");

		original.closest(".table-wrapper").append(copy);
		copy.wrap("<div class='pinned' />");
    copy.parent().css("width",pinned_width+"px")//eric
		original.wrap("<div class='scrollable' />");
    original.parent().css("margin-left",pinned_width+"px")//eric
    original.find("th:nth-child(-n+"+fixed_cols+"), td:nth-child(-n+"+fixed_cols+")").css("display", "none"); //eric
    //$("table.responsive th:nth-child(-n+"+fixed_cols+"), table.responsive td:nth-child(-n+"+fixed_cols+"), table.responsive td:nth-child(-n+"+fixed_cols+"), table.responsive.pinned td").css("display", "none"); //eric

    // console.time("bb");
    // setCellHeights(original, copy);
    // console.timeEnd("bb");
	}
	
	function unsplitTable(original) {
    original.closest(".table-wrapper").find(".pinned").remove();
    original.unwrap();
    original.unwrap();
    var fixed_cols = parseInt(original.data("fixed-cols") || 1); //eric
    $("table.responsive th:nth-child(-n+"+fixed_cols+"), table.responsive td:nth-child(-n+"+fixed_cols+"), table.responsive td:nth-child(-n+"+fixed_cols+"), table.responsive.pinned td").css("display", ""); //eric
	}

  function setCellHeights(original, copy) {
    var tr = original.find('tr'),
        tr_copy = copy.find('tr'),
        heights = [];

    tr.each(function (index) {
      var self = $(this),
          tx = self.find('th, td');

      tx.each(function () {
        var height = $(this).outerHeight(true);
        heights[index] = heights[index] || 0;
        if (height > heights[index]) heights[index] = height;
      });

    });

    tr_copy.each(function (index) {
      $(this).height(heights[index]);
    });
  }

});
