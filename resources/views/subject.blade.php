<!DOCTYPE html>
<html lang="ar" dir="rtl">

<head>
    <title>الفرز بناءا على الموضوعات</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    {{-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" --}}
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
        <!-- Styles -->
        {{-- <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
                width: auto;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
        </style> --}}
</head>

<body>
    <nav class="navbar navbar-inverse navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="{{ url('/') }}">الصفحة الرئيسية</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="{{ url('offers/create') }}">Add Document</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('offers.index-paging') }}">Display Documents</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ url('/report') }}">Reports</a>
                </li>
    {{--            <li class="nav-item">--}}
    {{--                <a class="nav-link" href="{{ url('/exportpdf') }}">downloadpdf </a>--}}
    {{--            </li>--}}
                @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                    <li class="nav-item active">
                        <a class="nav-link"
                           href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}"> {{ $properties['native'] }}
                            <span class="sr-only">(current)</span></a>
                    </li>
                @endforeach
    
    
            </ul>
            <form class="form-inline my-2 my-lg-0"  method="GET" action="{{route('offers.filter')}}" enctype="multipart/form-data" >
    {{--            <input class="form-control mr-sm-2"  type="search" name="search_" placeholder="Search" aria-label="Search">--}}
                <select name ="search_">
                    <option value="all"> </option>
                    <option value="vtms">vtms</option>
                    <option value="security">security</option>
                    <option value="radars">radars</option>
                    <option value="tawkitat">tawkitat</option>
                    <option value="power">power</option>
                    <option value="hospital_centers">hospital_centers</option>
                    <option value="technical_office">technical_office</option>
                    <option value="monitoring">monitoring</option>
                    <option value="Human_Resources">Human_Resources</option>
                </select>
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
    
    
        </div>
    </nav>
    <div class="container">
        <h3>اختر القطاع </h3>
        <div class="panel panel-primary">
            <div class="panel-heading">حدد الموضوع الخاص بك</div>
            <form  method="GET" action="{{route('offers.filter')}}" enctype="multipart/form-data" >
            <div class="panel-body">
                <div class="form-group">
                    <label for="section">القطاع</label>
                    <select id="directory" name="directory" class="form-control">
                        <option value="" selected disabled>إختر القطاع</option>
                        @foreach ($directories as $key => $directory)
                            <option value="{{ $directory }}"> {{ $directory }}</option>
                        @endforeach
                    </select>
                   
                </div>
                <div class="form-group">
                    <label for="subject">الموضوعات</label>
                    <select name="name_ar" id="name_ar" class="form-control"></select>
                </div>
                <div class="form-group">
                    <label for="subsubject">الموضوعات الفرعية</label>
                    <select name="subsubject" id="subsubject" class="form-control"></select>
                </div>
            </div>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">{{__('messages.search')}}</button>
            <td><a href="{{route('offers.export')}}" class="btn btn-danger"> Export to Excel</a></td>
            </form>
        </div>
    </div>
    <script>
        // when directory dropdown changes
        $('#directory').change(function() {

            var directoryID = $(this).val();

            if (directoryID) {

                $.ajax({
                    type: "GET",
                    url: "{{ url('getSubject') }}?directory=" + directoryID,
                    success: function(res) {

                        if (res) {

                            $("#name_ar").empty();
                            $("#name_ar").append('<option></option>');
                            $.each(res, function(key, value) {
                                $("#name_ar").append('<option value="' + value + '">' + value +
                                    '</option>');
                            });

                        } else {

                            $("#name_ar").empty();
                        }
                    }
                });
            } else {

                $("#subject").empty();
                $("#directory").empty();
            }
        });

        // when sub subject dropdown changes
        $('#name_ar').on('change', function() {

            var subject = $(this).val();
            
            if (subject) {

                $.ajax({
                    type: "GET",
                    url: "{{ url('getSubSubjects') }}?subject=" +subject,
                    success: function(res) {

                        if (res) {
                            $("#subsubject").empty();
                            $("#subsubject").append('<option></option>');
                            $.each(res, function(key, value) {
                                $("#subsubject").append('<option value="' +  value + '">' + value +
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