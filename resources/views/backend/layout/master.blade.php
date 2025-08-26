<!DOCTYPE html>
<html lang="en">

@include('backend.inc.head')
<body>

<main id="main" class="main">

    @include('backend.inc.menu')
    <div class="content-page">

        @if(session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        @if ($errors->any())
            <div class="alert alert-danger">
                <ul class="mb-0">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <div class="content">
            @yield('content')
        </div> <!-- content -->

    </div>
</main>
@include('backend.inc.footer')
</body>
</html>