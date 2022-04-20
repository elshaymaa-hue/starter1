<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
            <table>
            <td>
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
                <input type="text" class="form-control" name ="StatusRatioRadar" placeholder="{{__('messages.StatusRatioRadar')}}" value="{{$power_station->StatusRatioRadar}}">
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

            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.LastMessage')}}</label>
                <input type="text" class="form-control" name ="LastMessage" placeholder="{{__('messages.LastMessage')}}" value="{{__($power_station->LastMessage)}}">
                @error('LastMessage')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>

            </td>
                <td></td>
                <td>
             <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.DeisilInstallation')}}</label>
                <input type="text" class="form-control" name ="DeisilInstallation" placeholder="{{__('messages.DeisilInstallation')}}" value="{{__($power_station->DeisilInstallation)}}">
                @error('DeisilInstallation')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>

            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.ContractDesil')}}</label>
                <input type="text" class="form-control" name ="ContractDesil" placeholder="{{__('messages.ContractDesil')}}" value="{{__($power_station->ContractDesil)}}">
                @error('ContractDesil')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.PreDeliveryDesil')}}</label>
                <input type="text" class="form-control" name ="PreDeliveryDesil" placeholder="{{__('messages.PreDeliveryDesil')}}" value="{{__($power_station->PreDeliveryDesil)}}">
                @error('PreDeliveryDesil')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.FinalDeliveryDesil')}}</label>
                <input type="text" class="form-control" name ="FinalDeliveryDesil" placeholder="{{__('messages.FinalDeliveryDesil')}}" value="{{__($power_station->FinalDeliveryDesil)}}">
                @error('FinalDeliveryDesil')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.ATS1Transit')}}</label>
                <input type="text" class="form-control" name ="ATS1Transit" placeholder="{{__('messages.ATS1Transit')}}" value="{{__($power_station->ATS1Transit)}}">
                @error('ATS1Transit')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>


            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.ATS2VTMS')}}</label>
                <input type="text" class="form-control" name ="ATS2VTMS" placeholder="{{__('messages.ATS2VTMS')}}" value="{{__($power_station->ATS2VTMS)}}">
                @error('ATS2VTMS')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.AvrRadar')}}</label>
                <input type="text" class="form-control" name ="AvrRadar" placeholder="{{__('messages.AvrRadar')}}" value="{{__($power_station->AvrRadar)}}">
                @error('AvrRadar')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.SurgeRadar')}}</label>
                <input type="text" class="form-control" name ="SurgeRadar" placeholder="{{__('messages.SurgeRadar')}}" value="{{__($power_station->SurgeRadar)}}">
                @error('SurgeRadar')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.TawkitatSurgeProtect')}}</label>
                <input type="text" class="form-control" name ="TawkitatSurgeProtect" placeholder="{{__('messages.TawkitatSurgeProtect')}}" value="{{__($power_station->TawkitatSurgeProtect)}}">
                @error('TawkitatSurgeProtect')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            </td>
            </table>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.Desil')}}</label>
                <input type="textarea" class="form-control" name ="Desil" placeholder="{{__('messages.Desil')}}" value="{{__($power_station->Desil)}}">
                @error('Desil')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.IsolationTransformer')}}</label>
                <input type="textarea" class="form-control" name ="IsolationTransformer" placeholder="{{__('messages.IsolationTransformer')}}" value="{{__($power_station->IsolationTransformer)}}">
                @error('ATS1Transit')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <button type="submit" class="btn btn-primary">{{__('messages.update station')}}</button>
        </form>


    </div>
</div>
</body>
</html>
