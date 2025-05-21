$(document).ready(function(){
    $toc = $('.TOC');
    $('.hamburger').on('click', function(){
        $toc.toggleClass('active');
    });
    $('.TOC.active a').on('click', function(e){
        e.preventDefault();
        if($toc.hasClass('active')){
            $toc.removeClass('active');
            window.location.href = $(this).attr('href');
        }
    });
});