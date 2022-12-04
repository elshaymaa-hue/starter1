<!DOCTYPE html>
{{--<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">--}}
<html lang="ar" dir="rtl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Fonts -->
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
            justify-content: right;
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
        table, th, td {
            align:right;

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
                <a class="nav-link" href="{{ route('offers.all') }}">Display Documents</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ url('/report') }}">Reports</a>
            </li>
            {{-- <li class="nav-item">
                <a class="nav-link" href="{{route('offers.next_page') }}">next page</a>
            </li> --}}
           <li class="nav-item">
               <a class="nav-link" href="{{ url('/excel') }}">EXPORT EXCEL </a>
            </li>
         {{--   @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
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


@if(Session::has('success'))

    <div class="alert alert-success">
           {{Session::get('success')}}
    </div>
    @endif


@if(Session::has('error'))
     <div class="alert alert-danger">
         {{Session::get('error')}}
     </div>
@endif

<table class="table">
    <thead>
    <tr  align="right" lang="ar">
        <th scope="col">#</th>
        <th scope="col">{{__('messages.input')}}</th>
        <th scope="col">{{__('messages.output')}}</th>
        <th scope="col">{{__('messages.type')}}</th>
        <th scope="col">{{__('messages.Requested_side')}}</th>
        <th scope="col">{{__('messages.letterNo')}}</th>
        <th scope="col">{{__('messages.side_type')}}</th>
        <th scope="col">{{__('messages.directory')}}</th>
        <th scope="col">{{__('messages.Offer Name en')}}</th>
        <th scope="col">{{__('messages.Offer Name ar')}}</th>
        <th scope="col">{{__('messages.Offer Price')}}</th>
    </tr>
    <tr  align="right" lang="ar">
        <td></td>
        <th scope="col">{{__('messages.Offer details ar')}}</th>
        <th scope="col">{{__('messages.Offer details en')}}</th>
       
        <th scope="col">{{__('messages.status')}}</th>
        <th scope="col">{{__('messages.reply_on')}}</th>
       
        <th scope="col">{{__('messages.monitor_date')}}</th>
        <th scope="col">صوره العرض</th>
        <th scope="col">{{__('messages.additions')}}</th>
        <th scope="col">{{__('messages.created_at')}}</th>
        {{-- <th scope="col">{{__('messages.operation')}}</th> --}}
    </tr>
    </thead>
    <tbody>


    @foreach($offers as $offer)
        <tr align="right" lang="ar">
            <th scope="row">{{$offer -> id}}</th>
            <td>{{$offer -> input}}</td>
            <td>{{$offer -> output}}</td>
            <td>{{$offer -> type}}</td>
            <td>{{$offer -> Requested_side}}</td>
            <td>{{$offer -> letterNo}}</td>
            <td>{{$offer -> side_type}}</td>
            <td>{{$offer -> directory}}</td>
            <td>{{$offer -> name_en}}</td>
            <td>{{$offer -> name_ar}}</td>
            <td>{{$offer -> price}}</td>
        </tr>
        <tr  align="right" lang="ar">
            <td></td>
            <td>{{$offer -> details_ar}}</td>
            <td>{{$offer -> details_en}}</td>
          
            @if($offer -> status=="paused"||$offer -> status=="canceled")
            <td class="btn btn-danger">{{$offer -> status}}</td>
            @elseif($offer -> status=="waiting")
                <td  class="btn btn-warning">{{$offer -> status}}</td>
            @elseif($offer -> status=="done"||$offer -> status=="transferred")
                <td  class="btn btn-success">{{$offer -> status}}</td>
            @elseif($offer -> status=="progress")
                <td  class="btn btn-secondary">{{$offer -> status}}</td>
            @elseif($offer -> status=="start")
                <td  class="btn btn-primary">{{$offer -> status}}</td>
            @elseif($offer -> status=="monitor")
                <td  class="btn btn-warning">{{$offer -> status}}</td>
            @else
                <td>{{$offer -> status}}</td>
            @endif
            <td>{{$offer -> reply_on}}</td>
           
            <td>{{$offer -> monitor_date}}</td>
            @if($offer->photo)
            
                @if(file_exists('images/'.$offer->directory.'/'.$offer->name_ar.'/'.$offer->photo))
                    <td align="right"><embed src="{{asset('images/'.$offer->directory.'/'.$offer->name_ar.'/'.$offer->photo)}}" width="300px" height ="400px"></td>
                @else
                    <td align="right"><embed src="{{asset('images/'.$offer->directory.'/'.$offer->photo)}}" width="300px" height ="400px"></td>
                @endif
             
            @else
                <td></td>
            @endif
            @if($offer->additions)
            {{--            <td><img  style="width: 90px; height: 90px;" src="{{asset('images/offers/'.$offer->photo)}}"></td>--}}
                @if (file_exists('images/'.$offer->directory.'/'.$offer->name_ar.'/'.$offer->additions))
                <td align="right"><embed src="{{asset('images/'.$offer->directory.'/'.$offer->name_ar.'/'.$offer->additions)}}" width="300px" height ="400px"></td>
               @else
                    <td align="right"><embed src="{{asset('images/'.$offer->directory.'/'.$offer->additions)}}" width="300px" height ="400px"></td>
                @endif
        @else
            <td></td>
        @endif
            <td align="right">{{$offer -> created_at}}</td>
            <td>
                <a href="{{url('offers/edit/'.$offer -> id)}}" class="btn btn-success"> {{__('messages.update')}}</a>
            </td>
            <td>
                <a href="{{route('offers.delete',$offer -> id)}}" class="btn btn-danger"> {{__('messages.delete')}}</a>
             </td>

        </tr>
        
    @endforeach

    </tbody>



    @if(Session::has('success'))
        <div class="alert alert-success" role="alert">
            {{ Session::get('success') }}
        </div>
    @endif
        {{$offers->onEachSide(5)->links()}}
       

</table>
{{$offers->onEachSide(5)->links()}}
<script>
    const export2Pdf = async () => {

        let printHideClass = document.querySelectorAll('.print-hide');
        printHideClass.forEach(item => item.style.display = 'none');
        await fetch('http://localhost:8000/export-pdf', {
            method: 'GET'
        }).then(response => {
            if (response.ok) {
                response.json().then(response => {
                    var link = document.createElement('a');
                    link.href = response;
                    link.click();
                    printHideClass.forEach(item => item.style.display='');
                });
            }
        }).catch(error => console.log(error));
    }
</script>
</body>
</html>
