<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VMarketCrud</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <style>
        .navbar-brand {
            font-weight: bold;
        }

        .nav-link.active {
            font-weight: bold;
            color: #0d6efd;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="{{ url('/') }}">VMarketCrud</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link {{ request()->is('supplier') ? 'active' : '' }}"
                            href="{{ url('/supplier') }}">
                            Fornecedores
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ request()->is('product') ? 'active' : '' }}" href="{{ url('/product') }}">
                            Produtos
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <main class="container mt-4">
        @yield('content')
    </main>

    @yield('scripts')
</body>

</html>