$(function() {
    $("#vote-up").live("click", function() {
        $.getScript(this.href);
        return false;
    });
});
