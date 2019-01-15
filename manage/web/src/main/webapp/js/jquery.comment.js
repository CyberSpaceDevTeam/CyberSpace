(function ($) {

    // 1、页面初加载/新评论添加
    $.fn.addCommentList = function (options) {
        var defaults = {
            data: [],
            add: ""
        }
        // 拷贝
        var option = $.extend(defaults, options);
        // 加载数据
        if (option.data.length > 0) {
            var dataList = option.data;
            var totalString = "";
            for (var i = 0; i < dataList.length; i++) {
                var obj = dataList[i];
                // 构建评论区
                var objString = crateCommentInfo(obj);
                totalString = totalString + objString;
            }
            // 添加回复链接
            $(this).append(totalString).find(".reply-btn").click(function () {
                if ($(this).parent().parent().find(".replybox").length > 0) {
                    $(".replybox").remove();
                } else {
                    $(".replybox").remove();
                    replyClick($(this));
                }
            });
            // 回复链接点击相应事件
            $(".reply-list-btn").click(function () {
                if ($(this).parent().parent().find(".replybox").length > 0) {
                    $(".replybox").remove();
                } else {
                    $(".replybox").remove();
                    replyClick($(this));
                }
            })
        }

        // 添加新数据
        if (option.add != "") {
            obj = option.add;
            var str = crateCommentInfo(obj);
            $(this).prepend(str).find(".reply-btn").click(function () {
                replyClick($(this));
            });
        }
    }

    // 2、构建评论区
    function crateCommentInfo(obj) {

        if (typeof (obj.ctime) == "undefined" || obj.ctime == "") {
            obj.ctime = getNowDateFormat();
        }

        // obj.img需要修改为用户信息中的img
        // el表示评论具体内容构建
        var el = "<div class='comment-info'><header><img src='"
            + obj.img
            + "'></header><div class='comment-right'><h3>"
            + obj.userName
            + "</h3>"
            + "<div class='comment-content-header'><span><i class='glyphicon glyphicon-time'></i>"
            + obj.ctime + "</span>";

        el = el
            + "</div><p class='content'>"
            + obj.content
            + "</p><div class='comment-content-footer'><div class='row'><div class='col-md-10'>";

        el = el
            + "</div><div class='col-md-2'><span class='reply-btn'>回复</span></div></div></div><div class='reply-list'>";

        // 关于回复内容
        if (obj.replyBody != "" && obj.replyBody.length > 0) {
            var arr = obj.replyBody;
            for (var j = 0; j < arr.length; j++) {
                var replyObj = arr[j];
                el = el + createReplyComment(replyObj);
            }
        }
        el = el + "</div></div></div>";
        return el;
    }

    // 获取当前时间
    function getNowDateFormat() {
        var nowDate = new Date();
        var year = nowDate.getFullYear();
        var month = filterNum(nowDate.getMonth() + 1);
        var day = filterNum(nowDate.getDate());
        var hours = filterNum(nowDate.getHours());
        var min = filterNum(nowDate.getMinutes());
        var seconds = filterNum(nowDate.getSeconds());
        return year + "-" + month + "-" + day + " " + hours + ":" + min + ":"
            + seconds;
    }

    //
    function filterNum(num) {
        if (num < 10) {
            return "0" + num;
        } else {
            return num;
        }
    }

    // 返回每个回复体内容
    function createReplyComment(reply) {
        var replyEl = "<div class='reply'><div><a href='javascript:void(0)' class='replyname'>"
            + reply.replyName
            + "</a>:<a href='javascript:void(0)'>@"
            + reply.beReplyName
            + "</a><span>"
            + reply.content
            + "</span></div>"
            + "<p><span>"
            + reply.time
            + "</span> <span class='reply-list-btn'>回复</span></p></div>";
        return replyEl;
    }

})(jQuery);