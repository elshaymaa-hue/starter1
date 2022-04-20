<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Fonts -->
{{--        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;600&display=swap" rel="stylesheet">--}}
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">
        <!-- Styles -->

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

        .error {
            color: #ae1c17;
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
                    <a class="nav-link" href="{{ url('offers/report') }}">Reports</a>
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
                </select>
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
    
    
        </div>
    </nav>

<div class="flex-center position-ref full-height">
    <div class="content">
        <div class="title m-b-md">
            {{__('messages.update your offer')}}

        </div>
        '
        @if(Session::has('success'))
            <div class="alert alert-success" role="alert">
                {{ Session::get('success') }}
            </div>
        @endif

        <br>
        <form method="POST" action="{{route('offers.update',$offer->id)}}" enctype="multipart/form-data">
            @csrf
            {{-- <input name="_token" value="{{csrf_token()}}"> --}}
            <div class="form-group">

                <select name ="dir">
                    <option value="vtms">vtms</option>
                    <option value="security">security</option>
                    <option value="radars">radars</option>
                    <option value="tawkitat">tawkitat</option>
                    <option value="power">power</option>
                    <option value="hospital_centers">hospital_centers</option>
                    <option value="technical_office">technical_office</option>
                    <option value="Electorinc_Archive">Electorinc Archive</option>
                </select>
                <label for="exampleInputEmail1">تحديد القطاع</label>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">أختر صوره المستند</label>
                <input type="file" class="form-control" name="photo" placeholder="{{__('messages.photo')}}" value="{{$offer->photo}}">
                @error('photo')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <table class="table">
                <tr>
                    <td>
                    <div class="form-group">
                        <label for="exampleInputEmail1">{{__('messages.type')}}</label>
                        <input type="text" class="form-control" name ="type"  aria-describedby="emailHelp" placeholder="{{__('messages.type')}}" value="{{$offer->type}}">
                        @error('type')
                        <small class="form-text text-danger">{{$message}}</small>
                        @enderror
                    </div>
                    </td>
                    <td>
                    <div class="form-group">
                        <label for="exampleInputEmail1">{{__('messages.Offer Name ar')}}</label>
                        <input type="text" class="form-control" name="name_ar" placeholder="{{__('messages.Offer Name ar')}}" value="{{$offer->name_ar}}">
                        @error('name_ar')
                        <small class="form-text text-danger">{{$message}}</small>
                        @enderror
                    </div>
                    </td>
                    </tr>
           <tr>
            <td>
{{--                <p>{{'offers.update'.$offer->id}}</p>--}}
            <div class="form-group">
                <label for="exampleInputEmail1">{{__('messages.input')}}</label>
                <input type="text" class="form-control" name ="input"  aria-describedby="emailHelp" placeholder="{{__('messages.input')}}" value="{{$offer->input}}">
                @error('input')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            </td>
            <td>
            <div class="form-group">
                <label for="exampleInputEmail1">{{__('messages.output')}}</label>
                <input type="text" class="form-control" name ="output"  aria-describedby="emailHelp" placeholder="{{__('messages.output')}}" value="{{$offer->output}}">
                @error('output')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            </td>
            <td>
                <div class="form-group">
          <label for="exampleInputPassword1">{{__('messages.reply_on')}}</label>
          <input type="text" class="form-control" name ="reply_on" placeholder="{{__('messages.reply_on')}}" value="{{$offer->reply_on}}">
          @error('reply_on')
          <small class="form-text text-danger">{{$message}}</small>
          @enderror
      </div>
              </td>
            </tr>
        
            <tr>
            <td>
            <div class="form-group">
                <label for="exampleInputEmail1">{{__('messages.Offer Name en')}}</label>
                <input type="text" class="form-control" name="name_en" placeholder="{{__('messages.Offer Name en')}}" value="{{$offer->name_en}}">
                @error('name_en')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            </td>
            <td>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.Offer Price')}}</label>
                <input type="text" class="form-control" name="price" placeholder="{{__('messages.Offer Price')}}" value="{{$offer->price}}">
                @error('price')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            </td>
         
            </tr>
            <tr>
            
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.Offer details ar')}}</label>
                <input type="textarea"  class="form-control" name="details_ar"
                       placeholder="{{__('messages.Offer details ar')}}" value="{{$offer->details_ar}}">
                @error('details_ar')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            </tr>
            <tr>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.Offer details en')}}</label>
                <input type="text" class="form-control" name="details_en"
                       placeholder="{{__('messages.Offer details en')}}" value="{{$offer->details_en}}">
                @error('details_en')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            </tr>

            </tr>
                <tr>
                    <td align="center">
                        <div class="form-group ">

                            <label for="exampleInputEmail1">{{__('messages.status')}}</label>
                            <select name ="status"  placeholder="{{__('messages.status')}}" value="{{$offer->status}}">
                                <option value="done">إنتهى</option>
                                <option value="progress">قيد التنفيذ</option>
                                <option value="start">تخطيط</option>
                                <option value="canceled">إلغاء</option>
                                <option value="waiting">انتظار</option>
                                <option value="paused">معلق</option>
                                <option value="transferred">محول</option>
                            </select>
                            @error('status')
                            <small class="form-text text-danger">{{$message}}</small>
                            @enderror
                        </div>
                    </td>
                    <td>


                    </td>
                </tr>
           

        </table>
        <tr>
            <button type="submit" class="btn btn-primary">{{__('messages.update Offer')}}</button>
            </tr>
        </form>


    </div>
</div>
</body>
</html>
