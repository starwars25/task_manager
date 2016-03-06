var checkBoxClicked = function(checkbox) {
    var arr = checkbox.id.split('-');
    var task_id = arr[arr.length - 1];
    //document.getElementById('task-form-' + task_id).submit();
    $('#task-form-' + task_id).trigger('submit.rails');
};