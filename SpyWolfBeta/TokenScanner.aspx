<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TokenScanner.aspx.cs" Inherits="SpyWolfBeta.TokenScanner" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Token Scanner | SpyWolf Tools </title>
    <!-- Favicon icon -->
    <link rel="apple-touch-icon" sizes="180x180" href="images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
    <link rel="manifest" href="/site.webmanifest">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="./css/style.css">
    <script type="text/javascript">
        function RedirectToContractScanner(i) {
            if (i != '') {
                window.location.href = "/TokenScanner.aspx?add=" + i;
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
                                    <div class="input-group" style="width: 400px">
                                        <input type="text" class="form-control" id="txtAddressSearch" runat="server" placeholder="Scan Contract Address">
                                        <div class="input-group-append" onclick="RedirectToContractScanner(document.getElementById('txtAddressSearch').value)">
                                            <span class="input-group-text" id="basic-addon2"><i
                                                class="fa fa-search"></i></span>
                                        </div>
                                    </div>
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
                <a class="brand-logo" href="index.html">
                    <img src="./images/spywolf_tools_logo_light.svg" alt="">
                </a>
                <div class="menu">
                    <ul>
                        <li>
                            <a href="rewards.html">
                                <span><i class="mdi mdi-coin"></i></span>
                                <span class="nav-text">Rewards Tracker</span>
                            </a>
                        </li>
                        <li><a href="token-scanner.html">
                            <span><i class="mdi mdi-magnify"></i></span>
                            <span class="nav-text">Token Scanner</span>
                        </a>
                        </li>
                        <li><a href="wallet-tracker.html">
                            <span><i class="mdi mdi-crosshairs"></i></span>
                            <span class="nav-text">Wallet Tracker</span>
                        </a>
                        </li>
                        <li><a href="my-wallet.html">
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
                    <div class="row">
                        <div class="col-xl-5 col-lg-12 col-md-12">
                            <div class="card profile_card">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <img runat="server" id="imgLogo" class="me-3 rounded-circle me-0 me-sm-3" src="images/Spywolf-Profile.png" width="60" height="60" alt="">
                                        <div class="flex-grow-1">
                                            <span><asp:Label ID="txtTokenSymbol" runat="server" Text=""></asp:Label></span>
                                            <h4 class="mb-2"><asp:Label ID="txtTokenName" runat="server" Text=""></asp:Label></h4>
                                        </div>
                                    </div>
                                    <div class="card-profile__info">
                                        <div>
                                            <p class="mb-0 mt-1">Address</p>
                                            <h6><asp:Label ID="txtTokenAddress" runat="server" Text=""></asp:Label></h6>
                                        </div>
                                        <div>
                                            <p class="mb-0 mt-3">Has contract been verified?</p>
                                            <h6><asp:Label ID="txtTokenVerified" runat="server" Text=""/></h6>
                                        </div>
                                        <div>
                                            <p class="mb-0 mt-3">Are there any mint functions?</p>
                                            <h6><asp:Label ID="txtTokenMint" runat="server" Text=""/></h6>
                                        </div>
                                        <div>
                                            <p class="mb-0 mt-3">Is this a honeypot?</p>
                                            <h6><asp:Label ID="txtTokenHoneyPot" runat="server" Text=""/></h6>
                                        </div>
                                        <div>
                                            <p class="mb-0 mt-3">Current Price</p>
                                            <h6><asp:Label ID="txtTokenMc" runat="server" Text=""/></h6>
                                        </div>
                                        <div>
                                            <p class="mb-0 mt-3">Current Liquidity</p>
                                            <h6><asp:Label ID="txtTokenLp" runat="server" Text=""/></h6>
                                        </div>
                                    </div>
                                    <div class="social-icons">
                                        <a runat="server" id="linkWeb" class="youtube text-center" href="javascript:void(0)" target="_blank"><span><i class="fa fa-desktop"></i></span></a>
                                        <a runat="server" id="linkTG" class="facebook text-center" href="javascript:void(0)" target="_blank"><span><i class="fa fa-telegram"></i></span></a>
                                        <a runat="server" id="linkTwitter" class="twitter text-center" href="javascript:void(0)" target="_blank"><span><i class="fa fa-twitter"></i></span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-7 col-lg-12 col-md-12">
                            <div class="card acc_balance">
                                <div class="card-header">
                                    <h4 class="card-title">Top Holders</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="tblHolders" runat="server" class="table">
                                            <tbody>
                                                <%--<tr>
                                                    <td>#1</td>
                                                    <td>Team</td>
                                                    <td>6.3651%</td>
                                                    <td>6,365,129,405</td>
                                                    <td><a href="#" class="tx-link" target="_blank"><span class="tx"><i class="mdi mdi-chart-bar"></i></span></a></td>
                                                </tr>--%>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-header border-0">
                                    <h4 class="card-title">Latest Transactions</h4>
                                </div>
                                <div class="card-body pt-0">
                                    <div class="transaction-table">
                                        <div class="table-responsive">
                                            <table class="table mb-0 table-responsive-sm">
                                                <tbody>
                                                    <tr>
                                                        <td class="rewads-date-title">Tokens
                                                        </td>
                                                        <td class="rewads-timestamp-title">Price</td>
                                                        <td class="rewads-bnb-title">Price/Tokens</td>
                                                        <td class="rewads-bnb-title">Time</td>
                                                        <td class="rewads-tx-title">Tx
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-success">4,495,329 SPY
                                                        </td>
                                                        <td class="text-success">0.1200 BNB
                                                        </td>
                                                        <td class="text-success">$0.00001547
                                                        </td>
                                                        <td class="text-success">12:49:04 PM</td>
                                                        <td><a href="#" class="tx-link" target="_blank"><span class="tx"><i class="mdi mdi-web"></i></span></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-success">3,747,600 SPY
                                                        </td>
                                                        <td class="text-success">0.1000 BNB
                                                        </td>
                                                        <td class="text-success">$0.00001546
                                                        </td>
                                                        <td class="text-success">12:40:54 PM</td>
                                                        <td><a href="#" class="tx-link" target="_blank"><span class="tx"><i class="mdi mdi-web"></i></span></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-danger">1,736,870 SPY
                                                        </td>
                                                        <td class="text-danger">0.0480 BNB
                                                        </td>
                                                        <td class="text-danger">$0.00001569
                                                        </td>
                                                        <td class="text-danger">11:55:24 PM</td>
                                                        <td><a href="#" class="tx-link" target="_blank"><span class="tx"><i class="mdi mdi-web"></i></span></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-danger">1,769,309 SPY
                                                        </td>
                                                        <td class="text-danger">0.0489 BNB
                                                        </td>
                                                        <td class="text-danger">$0.00001570
                                                        </td>
                                                        <td class="text-danger">11:55:24 PM</td>
                                                        <td><a href="#" class="tx-link" target="_blank"><span class="tx"><i class="mdi mdi-web"></i></span></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-danger">883,570 SPY
                                                        </td>
                                                        <td class="text-danger">0.0244 BNB
                                                        </td>
                                                        <td class="text-danger">$0.00001570
                                                        </td>
                                                        <td class="text-danger">11:55:24 PM</td>
                                                        <td><a href="#" class="tx-link" target="_blank"><span class="tx"><i class="mdi mdi-web"></i></span></a></td>
                                                    </tr>
                                                </tbody>
                                            </table>
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
