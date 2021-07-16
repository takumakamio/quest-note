$(function () {
    // 画面遷移を検知
    $(document).on('turbolinks:load', function () {
        if ($('#calendar').length) {

            function Calendar() {
                return $('#calendar').fullCalendar({
                });
            }
            function clearCalendar() {
                $('#calendar').html('');
            }

            $(document).on('turbolinks:load', function () {
                Calendar();
            });
            $(document).on('turbolinks:before-cache', clearCalendar);

            //events: '/callendars.json(コントローラー名.json)', 以下に追加
            $('#calendar').fullCalendar({
                events: '/calendars.json',
                //カレンダー上部を年月で表示させる
                titleFormat: 'YYYY年 M月',
                //曜日を日本語表示
                dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
                //ボタンのレイアウト
                header: {
                    left: '',
                    center: 'title',
                    right: 'today prev,next'
                },
                //終了時刻がないイベントの表示間隔
                defaultTimedEventDuration: '03:00:00',
                buttonText: {
                    prev: '前',
                    next: '次',
                    prevYear: '前年',
                    nextYear: '翌年',
                    today: '今日',
                    month: '月',
                    week: '週',
                    day: '日'
                },

                // event クリックで編集、削除
                eventClick : function(event, jsEvent , view) {
                  jsEvent.preventDefault();
                //   JSモーダル読み込み時にリモートにしてあげる
                  $(".fc-event").attr("data-remote", "true");
                  $(`#quest-modal`).modal('show');
                },

                // Drag & Drop & Resize
                editable: true,
                //イベントの時間表示を２４時間に
                timeFormat: "HH:mm",
                //イベントの色を変える
                eventColor: '#87cefa',
                //イベントの文字色を変える
                eventTextColor: '#000000',
                eventRender: function(event, element) {
                    element.css("font-size", "0.8em");
                    element.css("padding", "5px");
                }
            });
        }
    });
});