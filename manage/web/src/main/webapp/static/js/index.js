var windowTop = 0;
$(window).scroll(function () {
    var scrolls = $(this).scrollTop();
    if (scrolls >= windowTop) {
        if (!$('.more-comment-list-block').hasClass('fadeOutUp')) {
            $('.more-comment-list-block').addClass('animated fadeOutUp');
            $('.more-comment-list-block').removeClass('fadeInDown');
            $('.container').css('margin-top', '45px');
        }
        windowTop = scrolls;
    } else {
        //需要执行显示导航动画操作
        if (!$('.more-comment-list-block').hasClass('fadeInDown')) {
            $('.more-comment-list-block').addClass('animated fadeInDown');
            $('.more-comment-list-block').removeClass('fadeOutUp');
            $('.container').css('margin-top', '148px');
        }
        windowTop = scrolls;
    }
});

