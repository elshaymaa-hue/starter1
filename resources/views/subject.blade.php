<!DOCTYPE html>
<html lang="en">

<head>
    <title>Laravel 8 Dynamic Dependent Dropdown using jQuery Ajax</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

    <div class="container">
        <h3>Laravel 8 Dynamic Dependent Dropdown using jQuery Ajax</h3>
        <div class="panel panel-primary">
            <div class="panel-heading">Laravel 8 Dynamic Dependent Dropdown using jQuery Ajax</div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="section">section:</label>
                    <select id="directory" name="directory" class="form-control">
                        <option value="" selected disabled>Select section</option>
                        @foreach ($directories as $key => $directory)
                            <option value="{{ $key }}"> {{ $directory }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="subject">Subject:</label>
                    <select name="subject" id="subject" class="form-control"></select>
                </div>
                <div class="form-group">
                    <label for="subsubject">sub subject:</label>
                    <select name="subsubject" id="subsubject" class="form-control"></select>
                </div>
            </div>
        </div>
    </div>
    <script>
        // when directory dropdown changes
        $('#directory').change(function() {

            var directoryID = $(this).val();

            if (directoryID) {

                $.ajax({
                    type: "GET",
                    url: "{{ url('getSubject') }}?directory_id=" + directoryID,
                    success: function(res) {

                        if (res) {

                            $("#subject").empty();
                            $("#subject").append('<option>Select Subject</option>');
                            $.each(res, function(key, value) {
                                $("#subject").append('<option value="' + key + '">' + value +
                                    '</option>');
                            });

                        } else {

                            $("#subject").empty();
                        }
                    }
                });
            } else {

                $("#subject").empty();
                $("#directory").empty();
            }
        });

        // when sub subject dropdown changes
        $('#subsubject').on('change', function() {

            var subjectID = $(this).val();

            if (subjectID) {

                $.ajax({
                    type: "GET",
                    url: "{{ url('getSubSubject') }}?subject_id=" + subjectID,
                    success: function(res) {

                        if (res) {
                            $("#subsubject").empty();
                            $("#subsubject").append('<option>Select sub subject</option>');
                            $.each(res, function(key, value) {
                                $("#subsubject").append('<option value="' + key + '">' + value +
                                    '</option>');
                            });

                        } else {

                            $("#subsubject").empty();
                        }
                    }
                });
            } else {

                $("#subsubject").empty();
            }
        });

    </script>
</body>

</html>