/**
 * Created by yorkchow on 14-12-24.
 */
$(function() {
    $('#side-menu').metisMenu();
});

// Load the correct sidebar on window load,
// collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
    $(window).bind("load resize", function() {
        topOffset = 50;
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $("div.navbar-collapse").addClass("collapse");
            topOffset = 100;
        } else {
            $("div.navbar-collapse").removeClass("collapse");
        }

        height = (this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height;
        height = height - topOffset;
        if (height < 1) height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
    })
});

function setIframeHeight(iframeId) {
    $("iframe#" + iframeId).iframeAutoHeight({debug: true});
}

$("#nav-tabs").on("click", "a", function(e) {
    e.preventDefault();
    $(this).tab("show");
})
    .on("click", "span", function() {
        var anchor = $(this).siblings("a");
        $(anchor.attr("href")).remove();
        $(this).parent().remove();
        $(".nav-tabs li").children("a").first().click();
    });

$("[data-src]").bind("click", function(e) {
    var id = $("#nav-tabs").children().length;
    $("a.active").removeClass("active");
    var target = e.target;
    if ($(target).attr("data-title") == undefined) {
        target = $(target).parent();
    }
    $(target).addClass("active");
    var src = $(target).attr("data-src");
    var title = $(target).attr("data-title");
    var icon = $(target).attr("icon-class");
    var tab = $("[tab-name='" + title +"']");

    $(target).addClass("active");
    var src = $(target).attr("data-src");
    var title = $(target).attr("data-title");
    var icon = $(target).attr("icon-class");
    var tab = $("[tab-name='" + title +"']");
    //var iframeName = title.toLowerCase();
    if (tab[0]) {
        tab.tab("show");
    } else {
        // create new tab
        e.preventDefault();
        $("ul#nav-tabs").last().append("<li><a href='#tab_" + id + "' data-toggle='tab' tab-name='" + title +
            "'><i class='fa " + icon + " fa-fw'></i> " + title + "</a><span>x</span></li>");

        var ifameHtml = "<iframe src='" + src + "' class='embed-responsive-item'></iframe>";
        $(".tab-content").append("<div class='tab-pane embed-responsive embed-responsive-4by3' id='tab_" + id +
            "'>" + ifameHtml + "</div>");

        $("[tab-name='" + title + "']").tab("show");
    }
});