<!DOCTYPE html>
<html lang="ar" dir="rtl">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>WELCOME</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Fonts -->
{{--        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;600&display=swap" rel="stylesheet">--}}
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
                        <a class="nav-link" href="{{ url('subject') }}">Reports</a>
                    </li>
                    {{-- <li class="nav-item">
                        <a class="nav-link" href="{{route('offers.next_page') }}">next page</a>
                    </li> --}}
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
                        <option value="technical_office">technical_office</option>
                        <option value="monitoring">monitoring</option>
                        <option value="Human_Resources">Human_Resources</option>
                    </select>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
        
        
            </div>
        </nav>
        <div class="flex-center position-ref full-height">


            <div class="content">
                <div class="title m-b-md">
                    {{__('messages.search document')}}

                </div>
                @if(Session::has ('alert'))
                <div class="alert alert-danger" role="alert">
                      {{ Session :: get('alert') }}
                </div>
                @endif
                <form class="form-group"  method="GET" action="{{route('offers.filter')}}" action="{{route('offers.export')}}" enctype="multipart/form-data" >
                    {{--            <input class="form-control mr-sm-2"  type="search" name="search_" placeholder="Search" aria-label="Search">--}}



                    <table class="table">
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="exampleInputEmail1">{{__('messages.input')}}</label>
                                <input type="text" class="form-control" name ="input"  aria-describedby="emailHelp" placeholder="{{__('messages.input')}}">
                                @error('input')
                                <small class="form-text text-danger">{{$message}}</small>
                                @enderror
                            </div>
                            </td>
                            <td>
                            <div class="form-group">
                                <label for="exampleInputEmail1">{{__('messages.output')}}</label>
                                <input type="text" class="form-control" name ="output"  aria-describedby="emailHelp" placeholder="{{__('messages.output')}}">
                                @error('output')
                                <small class="form-text text-danger">{{$message}}</small>
                                @enderror
                            </div>
                            </td>
                        <td>
                    <div class="form-group ">
                    <label for="exampleInputEmail1">{{__('messages.directory')}}</label>

                    
                    <select name ="search_">
                        <option value="all"> </option>
                        <option value="vtms">vtms</option>
                        <option value="security">security</option>
                        <option value="radars">radars</option>
                        <option value="tawkitat">tawkitat</option>
                        <option value="power">power</option>
                        <option value="technical_office">technical_office</option>
                        <option value="Electronic_Archive">Electronic_Archive</option>
                        <option value="Maintenance">Maintenance</option>
                        <option value="offers">offers</option>
                        <option value="monitoring">monitoring</option>
                        <option value="Human_Resources">Human_Resources</option>
                    </select>
                    </div>
                        </td>
                        <td>
                            <div class="form-group">
                       <label for="exampleInputEmail1">{{__('messages.subsubject')}}</label>
                       <input type="text" class="form-control" name ="subsubject"  aria-describedby="emailHelp">
                       @error('subsubject')
                       <small class="form-text text-danger">{{__('messages.subsubject required')}}</small>
                       @enderror
                   </div>
                         </td>
                        <td>
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
                        </td>
                        <td>
                            <div class="form-group">
                      <label for="exampleInputEmail1">{{__('messages.side_type')}}</label>
                      <select name ="side_type">
                        <option value="all"></option>
                        <option value="internal">داخلى</option>
                        <option value="external">خارجى</option>
                      </select>
                      @error('side_type')
                      <small class="form-text text-danger">{{$message}}</small>
                      @enderror
                  </div>
                        </td>
                        
                </tr>
                <tr>
                    <td>
                    <div class="form-group">
                        <label for="exampleInputEmail1">{{__('messages.type')}}</label>
                        <input type="text" class="form-control" name ="type"  aria-describedby="emailHelp" placeholder="{{__('messages.type')}}">
                        @error('type')
                        <small class="form-text text-danger">{{$message}}</small>
                        @enderror
                    </div>
                
                    <td>
                        <div class="form-group">
                  <label for="exampleInputEmail1">{{__('messages.Requested_side')}}</label>
                  <input type="text" class="form-control" name ="Requested_side"  aria-describedby="emailHelp" placeholder="{{__('messages.Requested_side')}}">
                  @error('Requested_side')
                  <small class="form-text text-danger">{{$message}}</small>
                  @enderror
              </div>
                    </td>
                
                <td>
                    <div class="form-group">
                        <label for="exampleInputEmail1">{{__('messages.monitor_date')}}</label>
                        <input type="text" class="form-control" name ="monitor_date"  aria-describedby="emailHelp" placeholder="{{__('messages.monitor_date')}}">
                        @error('monitor_date')
                        <small class="form-text text-danger">{{$message}}</small>
                        @enderror
                    </div>
                </td>
                <td>
                    <div class="form-group">
              <label for="exampleInputEmail1">{{__('messages.letterNo')}}</label>
              <input type="text" class="form-control" name ="letterNo"  aria-describedby="emailHelp" placeholder="{{__('messages.letterNo')}}">
              @error('letterNo')
              <small class="form-text text-danger">{{$message}}</small>
              @enderror
          </div>
                </td>
                </tr>
                <tr>
                    
                    <div class="form-group ">

                        <label for="exampleInputEmail1">{{__('messages.Offer Name ar')}}</label>
                        <input type="textarea" class="form-control" name="name_ar"  placeholder="{{__('messages.Offer Name ar')}}">
                        {{-- <select id="name_ar" name="name_ar" class="form-control">
                            <option value="" selected disabled></option>
                            @foreach ($subjects as $key => $subject)
                                <option value="{{ $key }}"> {{ $subject }}</option>
                            @endforeach
                        </select> --}}
                        {{-- <label for="exampleInputEmail1">{{__('messages.Offer Name ar')}}</label>
                        <select name ="name_ar">
                            <option value=""></option>
                            <option value="مشروع المتحف">مشروع المتحف</option>
                            <option value="منظومة كاميرات">منظومة كاميرات</option>
                            <option value="منظومة تامين ورش صيانة">منظومة تامين ورش صيانة</option>
                            <option value="منظومة تأمين الترسانة">منظومة تأمين الترسانة</option>
                            <option value="منظومة المراقبة الرادارية">منظومة المراقبة الرادارية</option>
                            <option value="منظومة اطفاء تلقائى خاصة بالمولد">منظومة اطفاء تلقائى خاصة بالمولد</option>
                            <option value="منظومة إطفاء الحريق">منظومة إطفاء الحريق</option>
                            <option value="ملاحظات متابعة محطات">ملاحظات متابعة محطات</option>
                        </select> --}}
                        
                        @error('name_ar')
                        <small class="form-text text-danger">{{$message}}</small>
                        @enderror
                     </div>
                    </tr>
                    <tr>
                   
                    </tr>
                    <tr>
                        
                        <div class="form-group ">
    
                            <label for="exampleInputEmail1">{{__('messages.Offer details ar')}}</label>
                            <input type="textarea" class="form-control" name="details_ar"  placeholder="{{__('messages.Offer details ar')}}">
                            @error('details_ar')
                            <small class="form-text text-danger">{{$message}}</small>
                            @enderror
                         </div>
                        </tr>
                    <tr>
                        <div class="form-group ">
    
                            <label for="exampleInputEmail1">{{__('messages.Offer Name en')}}</label>
                            <input type="textarea" class="form-control" name="name_en"  placeholder="{{__('messages.Offer Name en')}}">
                            @error('name_en')
                            <small class="form-text text-danger">{{$message}}</small>
                            @enderror
                         </div>
                    
                    </tr>
                </table>
                    <tr>
                        <td>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">{{__('messages.search')}}</button></td>

                     {{--            <input class="form-control mr-sm-2"  type="search" name="search_" placeholder="Search" aria-label="Search">--}}

                   <td><a href="{{route('offers.export')}}" class="btn btn-danger"> Export to Excel</a></td>
                    </tr>
                 
                </form>
                </div>
            </div>
        </div>
      
    </body>
</html>
