    jQuery(document).ready(
        function($) {
            $('.clickable-row tr').click(function() {
                window.document.location = $(this).data('url');
            });
        }
    );

