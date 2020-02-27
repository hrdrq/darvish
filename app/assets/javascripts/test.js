$(document).ready(function() {
$(".js-accessible").each(function (n, q) {
                var t = parseInt(d(this).data("fixed-cols") || 1),
                    u = d(this).clone().prop("id", "js-accessible-" + n + "-fixed").removeClass("js-accessible").addClass("js-accessible-fixed").attr("aria-hidden", "true");
                d(this).prop("id", "js-accessible-" + n + "-original");
                var o = d(this).find("tr > *:nth-child(-n+" + t + ")"),
                    m = d(this).find("tr > *:nth-child(" + t + ")"),
                    p = d(this).find("tr > *:nth-child(" + (t + 1) + ")"),
                    r = u.find("tr > *:nth-child(-n+" + t + ")"),
                    w = u.find("tr > *:nth-child(" + t + ")"),
                    v = d("<div />").addClass("js-accessible-scroll").prop("id", "js-accessible-" + n + "-scroll");
                o.addClass("fixed");
                m.addClass("fixed-last");
                p.addClass("non-fixed-first");
                r.addClass("fixed");
                w.addClass("fixed-last");
                d(this).wrap(v);
                u.insertBefore(d("#js-accessible-" + n + "-scroll"));
                u.find("tr > *:nth-child(n+" + (t + 1) + ")").remove();
            });
});