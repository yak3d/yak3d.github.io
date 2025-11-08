$(document).ready(function(){
    $(".post-div").slice(0, 4).show();
    $('#load-more').click(function(){
        $(".post-div:hidden").slice(0, 4).slideDown();
        if ($(".post-div:hidden").length == 0) {
            $("#load").fadeOut('slow');
        }
        $('html,body').animate({
            scrollTop: $(this).offset().top
        }, 1500);
    });
});
