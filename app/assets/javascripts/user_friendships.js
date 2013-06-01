//Ajax request to add a buddy from the profile page,
// removes stage of confirming if you want to a buddy


    $('#add-buddy').click(function(event){
        event.preventDefault();
        var addBuddyBtn = $(this);
        $.ajax({
            url: Routes.user_friendships_path({user_friendship:{ friend_id: addBuddyBtn.data('friendId')}}),
            dataType: 'json',
            type: 'POST',
            success: function(e) {
                addBuddyBtn.hide();
                $('#connect').html("<a href='#' class= 'btn btn-success'>Requested</a>");
            }

        });
    });


