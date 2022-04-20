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
                        <a class="nav-link" href="{{ url('power_stations/create') }}">Add Station</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('power_stations.index-paging') }}">Display Stations</a>
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
                {{-- <form class="form-inline my-2 my-lg-0"  method="GET" action="{{route('offers.filter')}}" enctype="multipart/form-data" >
       
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
                </form> --}}
        
        
            </div>
        </nav>
        <div class="flex-center position-ref full-height">
            @if (Route::has('login'))
                <div class="top-right links">
                    @auth
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ route('login') }}">Login</a>

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}">Register</a>
                        @endif
                    @endauth
                </div>
            @endif

            <div class="content">
                <div class="title m-b-md">
                      {{__('messages.add station')}}
{{--                    'photo'=>$file_name,--}}
{{--                    'station_name'=>$request->station_name,--}}
{{--                    'UpsSttp' =>$request->UpsSttp,--}}
{{--                    'UpsRadar' =>$request->UpsRadar,--}}
{{--                    'ContractUPS' =>$request->ContractUPS,--}}
{{--                    'UpslContractUPS'=>$request->UpslContractUPS,--}}
{{--                    'PreFinalDeliveryUPSUPS' =>$request->PreFinalDeliveryUPSUPS,--}}
{{--                    'FinalFinalDeliveryUPSUPS' =>$request->FinalFinalDeliveryUPSUPS,--}}
{{--                    'StatusRatioRadar' =>$request->StatusRatioRadar,--}}
{{--                    'StatusRatioSTTB'=>$request->StatusRatioSTTB,--}}
                </div>
                @if(Session::has ('success'))
                <div class="alert alert-success" role="alert">
                      {{ Session :: get('success') }}
                </div>
                @endif
                <form method="POST" action="{{route('power_stations.store')}}" enctype="multipart/form-data">
                    @csrf
                 
            <div class="form-group">
                <label for="exampleInputEmail1">أختر صوره المحطة</label>
                <input type="file" class="form-control" name="photo">
                @error('photo')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>


            <div class="form-group">
                <label for="exampleInputEmail1">{{__('messages.station name')}}</label>
                <input type="text" class="form-control" name="station_name" placeholder="{{__('messages.station name')}}" >
                @error('station_name')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <table>
            <td>
            <div class="form-group">
                <label for="exampleInputEmail1">{{__('messages.UpsSttp')}}</label>
                <input type="text" class="form-control" name ="UpsSttp" aria-describedby="emailHelp" placeholder="{{__('messages.UpsSttp')}}" >
                @error('UpsSttp')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.UpsRadar')}}</label>
                <input type="text" class="form-control" name ="UpsRadar" placeholder="{{__('messages.UpsRadar')}}" >
                @error('UpsRadar')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>

           
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.ContractUPS')}}</label>
                <input type="text" class="form-control" name ="ContractUPS" placeholder="{{__('messages.ContractUPS')}}" >
                @error('ContractUPS')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.UpslInstallation')}}</label>
                <input type="text" class="form-control" name ="UpslInstallation" placeholder="{{__('messages.UpslInstallation')}}" >
                @error('UpslInstallation')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
           
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.PreDeliveryUPS')}}</label>
                <input type="text" class="form-control" name ="PreDeliveryUPS" placeholder="{{__('messages.PreDeliveryUPS')}}" >
                @error('PreDeliveryUPS')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
        </td>
        <td></td>
        <td>
           
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.FinalDeliveryUPS')}}</label>
                <input type="text" class="form-control" name ="FinalDeliveryUPS" placeholder="{{__('messages.FinalDeliveryUPS')}}" >
                @error('FinalDeliveryUPS')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>

           
                <label for="exampleInputPassword1">{{__('messages.StatusRatioRadar')}}</label>
                <input type="text" class="form-control" name ="StatusRatioRadar" placeholder="{{__('messages.StatusRatioRadar')}}">
                @error('StatusRatioRadar')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>

           
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.StatusRatioSTTB')}}</label>
                <input type="text" class="form-control" name ="StatusRatioSTTB" placeholder="{{__('messages.StatusRatioSTTB')}}" >
                @error('StatusRatioSTTB')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
          
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.LastMessage')}}</label>
                <input type="text" class="form-control" name ="LastMessage" placeholder="{{__('messages.LastMessage')}}" >
                @error('LastMessage')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.Desil')}}</label>
                <input type="textarea" class="form-control" name ="Desil" placeholder="{{__('messages.Desil')}}">
                @error('Desil')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            </td>
                <td></td>
                <td>
             <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.DeisilInstallation')}}</label>
                <input type="text" class="form-control" name ="DeisilInstallation" placeholder="{{__('messages.DeisilInstallation')}}">
                @error('DeisilInstallation')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>

            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.ContractDesil')}}</label>
                <input type="text" class="form-control" name ="ContractDesil" placeholder="{{__('messages.ContractDesil')}}" >
                @error('ContractDesil')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.PreDeliveryDesil')}}</label>
                <input type="text" class="form-control" name ="PreDeliveryDesil" placeholder="{{__('messages.PreDeliveryDesil')}}" >
                @error('PreDeliveryDesil')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.FinalDeliveryDesil')}}</label>
                <input type="text" class="form-control" name ="FinalDeliveryDesil" placeholder="{{__('messages.FinalDeliveryDesil')}}" >
                @error('FinalDeliveryDesil')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.ATS1Transit')}}</label>
                <input type="text" class="form-control" name ="ATS1Transit" placeholder="{{__('messages.ATS1Transit')}}" >
                @error('ATS1Transit')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            
        </td>
        <td></td>
        <td>

            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.ATS2VTMS')}}</label>
                <input type="text" class="form-control" name ="ATS2VTMS" placeholder="{{__('messages.ATS2VTMS')}}" >
                @error('ATS2VTMS')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.AvrRadar')}}</label>
                <input type="text" class="form-control" name ="AvrRadar" placeholder="{{__('messages.AvrRadar')}}">
                @error('AvrRadar')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.SurgeRadar')}}</label>
                <input type="text" class="form-control" name ="SurgeRadar" placeholder="{{__('messages.SurgeRadar')}}" >
                @error('SurgeRadar')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.TawkitatSurgeProtect')}}</label>
                <input type="text" class="form-control" name ="TawkitatSurgeProtect" placeholder="{{__('messages.TawkitatSurgeProtect')}}">
                @error('TawkitatSurgeProtect')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">{{__('messages.IsolationTransformer')}}</label>
                <input type="textarea" class="form-control" name ="IsolationTransformer" placeholder="{{__('messages.IsolationTransformer')}}" >
                @error('ATS1Transit')
                <small class="form-text text-danger">{{$message}}</small>
                @enderror
            </div>
            </td>
            </table>
      

                    <button type="submit" class="btn btn-primary">{{__('messages.save station')}}</button>
                </form>
            </div>
        </div>
    </body>
</html>
