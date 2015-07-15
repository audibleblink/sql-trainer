ST.autoHighlightQueryText = {
  init: function(){
    var textarea = document.getElementById("attempt_query")
      , options  = {
        lineNumbers: true,
        mode: "text/x-sql",
        theme: "monokai",
        keyMap: "sublime",
        autofocus: true,
        extraKeys: {
          Tab: false,
          "Cmd-D": function(){
            var word = editor.findWordAt(editor.getCursor());
            editor.setSelection(word.anchor, word.head);
          }
        },
        cursorHeight: 0.8,
      }

    var editor = CodeMirror.fromTextArea(textarea, options);
  }
}
