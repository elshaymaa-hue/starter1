<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
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

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="{{ url('/') }}">WELCOME</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="{{ url('power_stations/create') }}">Add Station</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ url('power_stations/all') }}">Display Stations</a>
            </li>
            @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                <li class="nav-item active">
                    <a class="nav-link"
                       href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}"> {{ $properties['native'] }}
                        <span class="sr-only">(current)</span></a>
                </li>
            @endforeach


        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="flex-center position-ref full-height">
    <div class="content">
        <div class="title m-b-md">
            {{__('messages.update station')}}

        </div>

        @if(Session::has('success'))
            <div class="alert alert-success" role="alert">
                {{ Session::get('success') }}
            </div>
        @endif

        <br>
        <form method="POST" action="{{route('power_stations.update',$power_station->id)}}" enctype="multipart/form-data">
            @csrf
            {{-- <input name="_token" value="{{csrf_token()}}"> --}}


            <div class="form-group">
                <label for="exampleInputEmail1">أختر صوره المحطة</label>
                <input type="file" class="form-control" name="photo">
                @error('photo')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
{{--                <p>{{'offers.update'.$offer->id}}</p>--}}

            <div class="form-group">
                <label for="exampleInputEmail1">{{__('messages.station name')}}</label>
                <input type="text" class="form-control" name="station_name" placeholder="{{__('messages.station name')}}" value="{{$power_station->station_name}}">
                @error('station_name')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>


            <div class="form-group">
                <label for="exampleInputEmail1">{{__('messages.UpsSttp')}}</label>
                <input type="text" class="form-control" name ="UpsSttp" aria-describedby="emailHelp" placeholder="{{__('messages.UpsSttp')}}" value="{{$power_station->UpsSttp}}">
                @error('UpsSttp')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.UpsRadar')}}</label>
                <input type="text" class="form-control" name ="UpsRadar" placeholder="{{__('messages.UpsRadar')}}" value="{{$power_station->UpsRadar}}">
                @error('UpsRadar')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>

            {{--                    'ContractUPS'=>$request->ContractUPS,--}}
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.ContractUPS')}}</label>
                <input type="text" class="form-control" name ="ContractUPS" placeholder="{{__('messages.ContractUPS')}}" value="{{$power_station->ContractUPS}}">
                @error('ContractUPS')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.UpslInstallation')}}</label>
                <input type="text" class="form-control" name ="UpslInstallation" placeholder="{{__('messages.UpslInstallation')}}" value="{{$power_station->UpslInstallation}}">
                @error('UpslInstallation')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            {{--                    'PreFinalDeliveryUPSUPS'=>$request->PreFinalDeliveryUPSUPS,--}}
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.PreDeliveryUPS')}}</label>
                <input type="text" class="form-control" name ="PreDeliveryUPS" placeholder="{{__('messages.PreDeliveryUPS')}}" value="{{$power_station->PreDeliveryUPS}}">
                @error('PreDeliveryUPS')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            {{--                    'FinalDeliveryUPS'=>$request->FinalDeliveryUPS,--}}
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.FinalDeliveryUPS')}}</label>
                <input type="text" class="form-control" name ="FinalDeliveryUPS" placeholder="{{__('messages.FinalDeliveryUPS')}}" value="{{$power_station->FinalDeliveryUPS}}">
                @error('FinalDeliveryUPS')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            {{--                    'StatusRatiopower_station'=>$request->StatusRatiopower_station,--}}
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.StatusRatioRadar')}}</label>
                <input type="text" class="form-control" name ="SStatusRatioRadar" placeholder="{{__('messages.StatusRatioRadar')}}" value="{{$power_station->StatusRatioRadar}}">
                @error('StatusRatioRadar')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            {{--                    'StatusRatioSTTB'=>$request->StatusRatioSTTB,--}}
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.StatusRatioSTTB')}}</label>
                <input type="text" class="form-control" name ="StatusRatioSTTB" placeholder="{{__('messages.StatusRatioSTTB')}}" value="{{$power_station->StatusRatioSTTB}}">
                @error('StatusRatioSTTB')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            {{--                    'Remarks'=>$request->Remarks,--}}


            <button type="submit" class="btn btn-primary">{{__('messages.update station')}}</button>
        </form>


    </div>
</div>
</body>
</html>
