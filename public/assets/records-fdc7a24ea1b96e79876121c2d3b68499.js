var ready, setpositions;

set_positions = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('tr.record').each(function(i){
        $(this).attr("data-pos",i+1);
    });
}

ready = function(){
    // call sortable on our div with the sortable class
    $('.sortable').sortable();

    // after the order changes
    $('.sortable').sortable().bind('sortupdate', function(e, ui) {
        // array to store new order
        updated_order = []
        // set the updated positions
        set_positions();
 
        // populate the updated_order array with the new task positions
        $('tr.record').each(function(i){
            updated_order.push({ id: $(this).data("id"), position: i+1 });
        });
 
        // send the updated order via ajax
        $.ajax({
            type: "PUT",
            url: '/records/sort',
            data: { order: updated_order }
        });
    });
}

 
$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);
