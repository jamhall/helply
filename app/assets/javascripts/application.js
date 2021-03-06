// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require EpicEditor/epiceditor/js/epiceditor
//= require 'devbridge-autocomplete/dist/jquery.autocomplete'
//= require_tree .

$(document).ready(function () {
    $("nav[class='tabnav-tabs'] a").click(function (event) {
        $(this).addClass("selected");
        $(this).siblings().removeClass("selected");
        var tab = $(this).attr("href");
        $(".tab-content").not(tab).css("display", "none");
        $(tab).fadeIn();
    });

    $('#search').autocomplete({
        serviceUrl: '/search.json',
        minChars: 3,
        noCache: true,
        paramName: 'q',
        dataType: 'json',
        preventBadQueries: false,
        transformResult: function (response) {
            return {
                suggestions: $.map(response, function (result) {
                    return {value: result.title, data: result};
                })
            };
        },
        onSelect: function (suggestion) {
            location.href = '/articles/{id}/{slug}'.replace('{id}', suggestion.data.id).replace('{slug}', suggestion.data.slug);
        }
    });
});
