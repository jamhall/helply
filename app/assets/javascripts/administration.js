$(document).ready(function () {
    window.setTimeout(function() {
        var opts = {
            container: 'epiceditor',
            textarea: 'article_content',
            basePath: '',
            clientSideStorage: true,
            localStorageName: 'epiceditor',
            useNativeFullscreen: true,
            parser: marked,
            file: {
                name: 'epiceditor',
                defaultContent: '',
                autoSave: 100
            },
            theme: {
                base: '/assets/EpicEditor/epiceditor/themes/base/epiceditor.css',
                preview: '/assets/EpicEditor/epiceditor/themes/preview/preview-dark.css',
                editor: '/assets/EpicEditor/epiceditor/themes/editor/epic-light.css'
            },
            button: {
                preview: true,
                fullscreen: true,
                bar: "auto"
            },
            focusOnLoad: false,
            shortcut: {
                modifier: 18,
                fullscreen: 70,
                preview: 80
            },
            string: {
                togglePreview: 'Toggle Preview Mode',
                toggleEdit: 'Toggle Edit Mode',
                toggleFullscreen: 'Enter Fullscreen'
            },
            autogrow: true
        };
        var editor = new EpicEditor(opts).load();
    }, 0);
});