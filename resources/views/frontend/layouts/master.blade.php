<!DOCTYPE html>
<html lang="en">

@include('frontend.layouts.head')

<body class="config" id="filterWise" style="background-color: white;">
    @include('frontend.layouts.navbar')
    @include('frontend.layouts.message')
    <div class="content-page">
        <div class="content">
            @yield('content')
        </div>
    </div>
    </main>
    @include('frontend.layouts.footer')
    @yield('customCss')
    @yield('customJs')
    <script>
        @if ($errors->any())
            let errorMsg = '';
            @foreach ($errors->all() as $error)
                errorMsg += '{{ $error }}\n';
            @endforeach
            Swal.fire({
                icon: 'error',
                title: 'Subscription Error',
                text: errorMsg,
            });
        @endif
    
        @if (session('success'))
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: '{{ session('success') }}',
            });
        @endif
    
        @if (session('error'))
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '{{ session('error') }}',
            });
        @endif
    </script>
</body>

</html>