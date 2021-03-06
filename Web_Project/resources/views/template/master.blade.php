<?php
// Start the session
session_start();
?>

<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Fonts -->
  <link rel="stylesheet" href="{{asset('vendor/bootstrap/css/bootstrap.min.css')}}">
  <link rel="stylesheet" href="{{asset('vendor/fontawesome/css/all.min.css')}}">
  <title>
    @yield('title')
  </title>
<!-- Styles -->
   <link rel="stylesheet" href="{{asset("css/sign.css")}}"> -->
  <link rel="stylesheet" href="{{asset("bootstrap/css/bootstrap-grid.min.css")}}"> -->

  @yield('extra-css')
</head>
<body>
  <header>
    
    <?php
    //Set session variables
    $_SESSION["username"] = "green";
    echo 'Session variable is set.';
     ?>

    <!-- Nav -->
    <div><h1>@yield('heading')</h1></div>
  </header>

  
 
  <main>
    <div>@yield('content')</div>
  </main>

 
</body>
</html>