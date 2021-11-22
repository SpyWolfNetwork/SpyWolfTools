<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rewards.aspx.cs" Inherits="SpyWolfBeta.Rewards" %>

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
        <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True" AllowResize="false"
            CloseAction="CloseButton" ContentUrl="ChartPopUp.aspx"
            EnableViewState="False"  PopupHorizontalAlign="WindowCenter"
            PopupVerticalAlign="WindowCenter" ShowFooter="True" ShowOnPageLoad="false"
            Width="650px" Height="510px" MinWidth="310px" MinHeight="280px"
            FooterText=""
            HeaderText="Latest 10 Rewards" ClientInstanceName="popup" EnableHierarchyRecreation="True" FooterStyle-Wrap="True">
            <ContentStyle Paddings-Padding="0" />
        </dx:ASPxPopupControl>
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
                                            <input type="text" class="form-control" id="txtAddressSearch" runat="server" placeholder="Search for your address" >
                                            <div class="input-group-append" onclick="RedirectToRewards(document.getElementById('txtAddressSearch').value)">
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
                            <a href="Rewards.aspx" class="active">
                                <span><i class="mdi mdi-coin"></i></span>
                                <span class="nav-text">Rewards Tracker</span>
                            </a>
                        </li>
                        <li>
                            <a href="Home.html" class="disabled">
                                <span><i class="mdi mdi-magnify"></i></span>
                                <span class="nav-text">Token Scanner</span>
                            </a>
                        </li>
                        <li>
                            <a href="Home.html" class="disabled">
                                <span><i class="mdi mdi-crosshairs"></i></span>
                                <span class="nav-text">Wallet Tracker</span>
                            </a>
                        </li>
                        <li><a href="Home.html" class="disabled">
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
            <div class="page_title">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="page_title-content">
                                <p style="display: inline-table">
                                    Address:
                                    <asp:Label ID="txtAddressReadOnly" onchange="UpdateLink();" runat="server" Text=""></asp:Label>
                                    <a id="bscWalletLink" runat="server" href="#" target="_blank"><span class="bscscan"><i class="mdi mdi-launch"></i></span></a><span></span>
                                    <dx:ASPxButton ID="showGraph" runat="server" Text="View Graph" AutoPostBack="false" ClientEnabled="false">
                                        <ClientSideEvents
                                            Click="function(s, e) { popup.Show(); }"></ClientSideEvents>
                                    </dx:ASPxButton>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="content-body">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-header border-0">
                                    <h4 class="card-title">Your BNB Rewards History</h4>
                                    <h4 class="card-title">Total: <span runat="server" id="txtTotalRewards" class="rewards-total-amount"></span></h4>
                                </div>
                                <div class="card-body pt-0">
                                    <div class="transaction-table">
                                        <div class="table-responsive">
                                            <table class="table mb-0 table-responsive-sm" id="tblRewards" runat="server">
                                                <tbody>
                                                    <tr>
                                                        <td class="rewads-tx-title">Tx
                                                        </td>
                                                        <td class="rewads-date-title">Date
                                                        </td>
                                                        <td class="rewads-timestamp-title">Age</td>
                                                        <td class="rewads-bnb-title">BNB Rewards</td>
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
