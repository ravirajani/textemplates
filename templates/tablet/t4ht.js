$(document).ready(function(){
    $toc = $('.TOC');
    $('.header-bar .hamburger').on('click', function(){
        $toc.toggleClass('active');
    });
    $('.TOC a').on('click', function(){
        if($toc.hasClass('active')) {
            $toc.removeClass('active');
        }
    });
});