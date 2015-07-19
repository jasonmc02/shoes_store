(function () {
  var url = window.location.pathname,
      navbar = $("#navbar");
  navbar.find("li.active").removeClass("active");
  if (url.indexOf("stores") > -1) {
    navbar.find("li").eq(1).addClass("active");
  } else {
    navbar.find("li").eq(0).addClass("active");
  }
})();