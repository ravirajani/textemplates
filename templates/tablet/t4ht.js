$(document).ready(function(){
    $toc = $('.TOC');
    $('.hamburger').on('click', function(){
        $toc.toggleClass('active');
    });
});
