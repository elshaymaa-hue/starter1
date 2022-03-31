<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel 8 HTML to PDF Example</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
</head>

<body class="antialiased container mt-5">

<table class="table">
    <thead>
    <tr class="table-primary">
        <td>Product Name</td>
        <td>Price</td>
        <td>In Stock</td>
    </tr>
    </thead>
    <tbody>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">{{__('messages.input')}}</th>
            <th scope="col">{{__('messages.output')}}</th>
            <th scope="col">{{__('messages.type')}}</th>
            <th scope="col">{{__('messages.Offer Name en')}}</th>
            <th scope="col">{{__('messages.Offer Name ar')}}</th>
            <th scope="col">{{__('messages.Offer Price')}}</th>
            <th scope="col">{{__('messages.Offer details en')}}</th>
            <th scope="col">{{__('messages.Offer details ar')}}</th>
            <th scope="col">صوره العرض</th>

            <th scope="col">{{__('messages.operation')}}</th>
        </tr>
        </thead>
        <tbody>


        @foreach($offers as $offer)
            <tr>
                <th scope="row">{{$offer -> id}}</th>
                <td align="right">{{$offer -> input}}</td>
                <td align="right">{{$offer -> output}}</td>
                <td align="right">{{$offer -> type}}</td>
                <td align="right">{{$offer -> name_en}}</td>
                <td align="right">{{$offer -> name_ar}}</td>
                <td align="right">{{$offer -> price}}</td>
                <td align="right">{{$offer -> details_en}}</td>
                <td align="right">{{$offer -> details_ar}}</td>
                @if($offer->photo)
                    {{--            <td><img  style="width: 90px; height: 90px;" src="{{asset('images/offers/'.$offer->photo)}}"></td>--}}
                    <td align="right"><embed src="{{asset('images/'.$offer->directory.'/'.$offer->photo)}}" width="300px" height ="300px"></td>
                @else
                    <td></td>
                @endif

                <td>
                    <a href="{{url('offers/edit/'.$offer -> id)}}" class="btn btn-success"> {{__('messages.update')}}</a>
                    {{--                <a href="{{route('offers.delete',$offer -> id)}}" class="btn btn-danger"> {{__('messages.delete')}}</a>--}}
                </td>

            </tr>
        @endforeach
    </tbody>
</table>
</body>

</html>