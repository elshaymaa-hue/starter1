<!DOCTYPE html>
<html lang="ar" dir="rtl">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>WELCOME1</title>

        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;600&display=swap" rel="stylesheet">--}}
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
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
        </style>
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="{{ url('/') }}">WELCOME1</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ url('offers/create') }}">Add Document</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ url('offers/all') }}">Display Documents</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ url('/report') }}">Reports</a>
                </li>
                @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                    <li class="nav-item">
                        <a class="nav-link" href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}">{{ $properties['native'] }}</a>
                    </li>
                @endforeach
                {{--                @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)--}}
                {{--                    <li>--}}
                {{--                        <a rel="alternate" hreflang="{{ $localeCode }}" href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}">--}}
                {{--                            {{ $properties['native'] }}--}}
                {{--                        </a>--}}
                {{--                    </li>--}}
                {{--                @endforeach--}}

                {{--                <li class="nav-item dropdown">--}}
                {{--                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--}}
                {{--                        choose action--}}
                {{--                    </a>--}}
                {{--                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">--}}
                {{--                        <a class="dropdown-item" href="{{ route('offers.create') }}">Add Document</a>--}}
                {{--                        <a class="dropdown-item" href="{{ route('offers.all') }}">Display Documents</a>--}}
                {{--                        <div class="dropdown-divider"></div>--}}
                {{--                        <a class="dropdown-item" href="#">Something else here</a>--}}
                {{--                    </div>--}}
                {{--                </li>--}}

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
                </select>
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
        <div class="flex-center position-ref full-height">


            <div class="content">
                <div class="title m-b-md">


                </div>

                <form class="form-group"  method="GET" action="{{route('offers.export')}}" enctype="multipart/form-data" >
                    {{--            <input class="form-control mr-sm-2"  type="search" name="search_" placeholder="Search" aria-label="Search">--}}



                    <br/>
                    <label for="exampleInputEmail1">{{__('messages.directory')}}</label>

                    <br/>
                    <select name ="search_">
                        <option value=" ">  </option>
                        <option value="vtms">vtms</option>
                        <option value="security">security</option>
                        <option value="radars">radars</option>
                        <option value="tawkitat">tawkitat</option>
                        <option value="power">power</option>
                        <option value="hospital_centers">hospital_centers</option>
                        <option value="Maintenance">Maintenance</option>
                        <option value="Electronic_Archive">Electronic_Archive</option>
                        <option value="technical_office">technical_office</option>
                    </select>

                    <div class="form-group">
                        <label for="exampleInputEmail1">{{__('messages.input')}}</label>
                        <input type="text" class="form-control" name ="input"  aria-describedby="emailHelp" placeholder="{{__('messages.input')}}">
                        @error('input')
                        <small class="form-text text-danger">{{$message}}</small>
                        @enderror
                    </div>
                    <div class="form-group ">

                        <label for="exampleInputEmail1">{{__('messages.status')}}</label>
                        <select name ="status">
                            <option value=""></option>
                            <option value="done">إنتهى</option>
                            <option value="progress">قيد التنفيذ</option>
                            <option value="start">تخطيط</option>
                            <option value="canceled">إلغاء</option>
                            <option value="waiting">انتظار</option>
                            <option value="paused">معلق</option>
                            <option value="transferred">محول</option>
                            <option value="monitor">متابعة</option>
                        </select>
                        @error('status')
                        <small class="form-text text-danger">{{$message}}</small>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">{{__('messages.output')}}</label>
                        <input type="text" class="form-control" name ="output"  aria-describedby="emailHelp" placeholder="{{__('messages.output')}}">
                        @error('output')
                        <small class="form-text text-danger">{{$message}}</small>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">{{__('messages.type')}}</label>
                        <input type="text" class="form-control" name ="type"  aria-describedby="emailHelp" placeholder="{{__('messages.type')}}">
                        @error('type')
                        <small class="form-text text-danger">{{$message}}</small>
                        @enderror
                    </div>
                   
                        <div class="form-group ">
    
                            <label for="exampleInputEmail1">{{__('messages.Offer Name ar')}}</label>
                            <input type="textarea" class="form-control" name="name_ar"  placeholder="{{__('messages.Offer Name ar')}}">
                            @error('name_ar')
                            <small class="form-text text-danger">{{$message}}</small>
                            @enderror
                         </div>
                         <div class="form-group ">
    
                            <label for="exampleInputEmail1">{{__('messages.Offer Name en')}}</label>
                            <input type="textarea" class="form-control" name="name_en"  placeholder="{{__('messages.Offer Name en')}}">
                            @error('name_en')
                            <small class="form-text text-danger">{{$message}}</small>
                            @enderror
                         </div>
{{--                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--}}

                     {{--            <input class="form-control mr-sm-2"  type="search" name="search_" placeholder="Search" aria-label="Search">--}}

                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Export to Excel </button>
                </form>
                </div>
            </div>
        </div>
    </body>
</html>
