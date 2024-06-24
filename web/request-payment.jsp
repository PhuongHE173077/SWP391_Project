<%-- 
    Document   : request-payment
    Created on : Jun 20, 2024, 5:57:58 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!-- Custom styles for this template -->
        <link href="/tryitnow/Styles/jumbotron-narrow.css" rel="stylesheet">
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="/tryitnow/Styles/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="/tryitnow/Styles/js/ie-emulation-modes-warning.js"></script>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    
        <![endif]-->

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <style>
            @font-face {
                font-family: 'monica-ext-font_YIBBBFG';
                src: url('chrome-extension://fhimbbbmdjiifimnepkibjfjbppnjble/static/fonts/Hind-Light.otf');
                font-weight: 300;
                font-display: swap;
            }
            @font-face {
                font-family: 'monica-ext-font_YIBBBFG';
                src: url('chrome-extension://fhimbbbmdjiifimnepkibjfjbppnjble/static/fonts/Hind-Regular.otf');
                font-weight: 400;
                font-display: swap;
            }
            @font-face {
                font-family: 'monica-ext-font_YIBBBFG';
                src: url('chrome-extension://fhimbbbmdjiifimnepkibjfjbppnjble/static/fonts/Hind-Medium.otf');
                font-weight: 500;
                font-display: swap;
            }
            @font-face {
                font-family: 'monica-ext-font_YIBBBFG';
                src: url('chrome-extension://fhimbbbmdjiifimnepkibjfjbppnjble/static/fonts/Hind-SemiBold.otf');
                font-weight: 600;
                font-display: swap;
            }</style><style id="monica-reading-highlight-style">
            .monica-reading-highlight {
                animation: fadeInOut 1.5s ease-in-out;
            }

            @keyframes fadeInOut {
                0%, 100% {
                    background-color: transparent;
                }
                30%, 70% {
                    background-color: rgba(2, 118, 255, 0.20);
                }
            }
        </style>
    </head>
    <body style="font-size: 0.9rem;" monica-version="5.5.1" monica-id="fhimbbbmdjiifimnepkibjfjbppnjble">
        <div class="container">
            <div class="clearfix" style="padding-bottom: 1rem;">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a class="navbar-brand" href="/tryitnow/">VNPAY DEMO</a>
                </nav>
            </div>

            <h3>Request payment</h3>
            <div class="table-responsive">
                <form action="payment" id="frmCreateOrder" method="post">    
                    <input type="hidden" name="type" value="request">
                    <input type="hidden" name="requestId" value="${requestId}">
                    
                    <div class="form-group">
                        <label for="Amount">Amount: </label>
                        <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="Amount" name="amount" type="text" value="${amount}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="OrderDescription">Payment content</label>
                        <textarea class="form-control" cols="20" id="OrderDescription" name="OrderDescription" rows="2" data-listener-added_94da5abf="true">Thanh toan don hang thoi gian: 2024-06-20 09:32:39</textarea>
                        <span id="monica-writing-entry-btn-root" style="position: absolute; left: 0px; top: 0px; pointer-events: none; z-index: 2147483647;"><div class="_monica-theme-d2f2b383"><div class="_monica-theme-d2f2b383" style="top: 0px; left: 0px; position: absolute;"><div id="monica-writing-entry-btn-mirror-node" style="box-sizing: border-box; left: 232px; top: 334.422px; width: 1108px; height: 60px; border: 1px solid transparent; border-radius: 4px; padding: 6px 12px; margin: 0px; position: absolute; pointer-events: none; overflow: hidden;"><div class="monica-writing-entry-btn-wrapper" id="monica-writing-entry-btn" style="display: inline-flex; opacity: 1; right: 21px; bottom: 8px;"><div><span style="display: flex; align-items: center; justify-content: center; width: 16px; height: 16px;"><span style="display: inline-block; width: 8px; height: 8px; border-radius: 8px; background: var(--theme-icon-brand); cursor: pointer;"></span></span></div></div></div></div></div></span></div>
                    <div class="form-group">
                        <label for="bankcode">Banking: </label>
                        <select name="bankcode" id="bankcode" class="form-control">
                            <option value="">Not choosen </option>    
                            <option value="QRONLY">Via QRONLY</option>			
                            <option value="MBAPP">Using MobileBanking</option>			
                            <option value="VNPAYQR">VNPAYQR</option>
                            <option value="VNBANK">LOCAL BANK</option>
                            <option value="IB">INTERNET BANKING</option>
                            <option value="ATM">ATM CARD</option>
                            <option value="INTCARD">INTERNATIONAL CARD</option>
                            <option value="VISA">VISA</option>
                            <option value="MASTERCARD"> MASTERCARD</option>
                            <option value="JCB">JCB</option>
                            <option value="UPI">UPI</option>
                            <option value="VIB">VIB</option>
                            <option value="VIETCAPITALBANK">VIETCAPITALBANK</option>
                            <option value="SCB"> SCB</option>
                            <option value="NCB"> NCB</option>
                            <option value="SACOMBANK"> SacomBank  </option>
                            <option value="EXIMBANK"> EximBank </option>
                            <option value="MSBANK"> MSBANK </option>
                            <option value="NAMABANK"> NamABank </option>
                            <option value="VNMART"> Vi dien tu VnMart</option>
                            <option value="VIETINBANK"> Vietinbank  </option>
                            <option value="VIETCOMBANK"> VCB </option>
                            <option value="HDBANK"> HDBank</option>
                            <option value="DONGABANK"> Dong A</option>
                            <option value="TPBANK"> TPBank </option>
                            <option value="OJB"> OceanBank</option>
                            <option value="BIDV"> BIDV </option>
                            <option value="TECHCOMBANK"> Techcombank </option>
                            <option value="VPBANK"> VPBank </option>
                            <option value="AGRIBANK"> Agribank </option>
                            <option value="MBBANK"> MBBank </option>
                            <option value="ACB"> ACB </option>
                            <option value="OCB"> OCB </option>
                            <option value="IVB"> IVB </option>
                            <option value="SHB"> SHB </option>
                            <option value="APPLEPAY">Apple Pay </option>
                            <option value="GOOGLEPAY">Google Pay </option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="language">Language</label>
                        <select name="language" id="language" class="form-control">
                            <option value="vn">Vietnamese</option>
                            <option value="en">English</option>
                        </select>
                    </div>
                    <!--<button type="submit" class="btn btn-default" id="btnPopup">Thanh toán Popup</button>-->
                    <button type="submit" class="btn btn-default">Submit payment</button>

                </form>
            </div>
            <p>
                &nbsp;
            </p>

            <footer class="footer">
                <p>© VNPAY 2024</p>
            </footer>
        </div> <!-- /container -->
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="/tryitnow/Styles/js/ie10-viewport-bug-workaround.js"></script>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet">
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.js"></script>  
        <script>
        </script>

        <div id="vnpay_overlay" class="vnpay_overlay" style="display: none;"></div><div id="vnpay_modal" class="vnpay_modal" style="display: none;"><div id="vnpay_content" class="vnpay_content"></div><a id="vnpay_close" href="#" class="vnpay_close">close</a></div><div id="monica-content-root" class="monica-widget"></div>
    </body>
</html>
