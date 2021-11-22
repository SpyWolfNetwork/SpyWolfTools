<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SpyWolfBeta.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Rewards Tracker | SpyWolf Tools </title>
    <!-- Favicon icon -->
    <link rel="apple-touch-icon" sizes="180x180" href="images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
    <link rel="manifest" href="/site.webmanifest">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="./css/style.css">
    <script type="text/javascript">
        function RedirectToRewards(i) {
            if (i != '') {
                window.location.href = "/Rewards.aspx?add=" + i;
            }
        }

    </script>
    <style>
        a.disabled {
            pointer-events: none;
            cursor: default;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server" class="form">
        <div id="preloader">
            <div class="sk-three-bounce">
                <div class="sk-child sk-bounce1"></div>
                <div class="sk-child sk-bounce2"></div>
                <div class="sk-child sk-bounce3"></div>
            </div>
        </div>
        <div id="main-wrapper">
            <div class="header">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <nav class="navbar">
                                <div class="header-search">
                                    <form action="#">
                                        <div class="input-group" style="width:400px">
                                            <input type="text" class="form-control" id="walletAddress" placeholder="Paste your address here to see your rewards">
                                            <div class="input-group-append" onclick="RedirectToRewards(document.getElementById('walletAddress').value)">
                                                <span class="input-group-text" id="basic-addon2"><i
                                                    class="fa fa-search"></i></span>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="dashboard_log my-2" style="visibility: hidden">
                                    <div class="d-flex align-items-center">
                                        <div class="profile_log dropdown">
                                            <div class="user" data-toggle="dropdown">
                                                <span class="thumb"><i class="mdi mdi-wallet"></i></span>
                                                <a href="#" class="name">0x60f9fe587DD...</a>
                                                <span class="arrow"><i class="la la-angle-down"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sidebar">
                <a class="brand-logo" href="Home.aspx">
                    <img src="./images/spywolf_tools_logo_light.svg" alt="">
                </a>
                <div class="menu">
                    <ul>
                        <li>
                            <a href="Rewards.aspx">
                                <span><i class="mdi mdi-coin"></i></span>
                                <span class="nav-text">Rewards Tracker</span>
                            </a>
                        </li>
                        <li>
                            <%--<a href="token-scanner.html">--%>
                            <a href="Home.html" class="disabled">
                                <span><i class="mdi mdi-magnify"></i></span>
                                <span class="nav-text">Token Scanner</span>
                            </a>
                        </li>
                        <li>
                            <%-- <a href="wallet-tracker.html">--%>
                            <a href="Home.html" class="disabled">
                                <span><i class="mdi mdi-crosshairs"></i></span>
                                <span class="nav-text">Wallet Tracker</span>
                            </a>
                        </li>
                        <li>
                            <%--<a href="my-wallet.html">--%>
                            <a href="Home.html" class="disabled">
                                <span><i class="mdi mdi-wallet"></i></span>
                                <span class="nav-text">My Wallet</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="sidebar-footer">
                    <div class="social">
                        <a href="https://spywolf.co/" target="_blank"><i class="fa fa-desktop"></i></a>
                        <a href="https://t.me/SpyWolfNetwork" target="_blank"><i class="fa fa-telegram"></i></a>
                        <a href="https://twitter.com/SpyWolfNetwork" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a href="https://www.youtube.com/channel/UCNBNy4a3ao0OMCdjw3zzPQA/featured" target="_blank"><i class="fa fa-youtube-play"></i></a>
                    </div>
                    <div class="copy_right">
                        ©
                  <script>
                      var CurrentYear = new Date().getFullYear()
                      document.write(CurrentYear)
                  </script>
                        SpyWolf
                    </div>
                </div>
            </div>
            <div class="content-body">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-7">
                            <div class="section_heading">
                                <span>Welcome to SpyWolf.tools</span>
                                <h3>The must-have web tools for crypto investors</h3>
                                <p>Track your rewards, research other tokens, track wallets and see exactly which tokens you are holding in an user-friendly way.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="position-relative" id="intro" data-scroll-index="0">
                            <div class="container">
                                <div class="row align-items-center justify-content-around">
                                    <div class="col-xl-5 col-md-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <h3>Track your BNB Rewards</h3>
                                                <p>See every reward you get from holding $SPY with the total BNB/dollar value.</p>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-body">
                                                <h3>Research any Token</h3>
                                                <p>Look up any token you want before investing to make sure your money is safe.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-5 col-md-6 py-md-5">
                                        <div class="card">
                                            <div class="card-body">
                                                <h3>Track any Wallet</h3>
                                                <p>Keep an eye of any suspicious wallet or a whale's wallet to trace every move.</p>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-body">
                                                <h3>Visualize your Wallet</h3>
                                                <p>See all your tokens, their value and the percentages you're holding in an easy-to-use visual wallet.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="./vendor/jquery/jquery.min.js"></script>
        <script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="./js/scripts.js"></script>
    </form>
</body>
</html>
