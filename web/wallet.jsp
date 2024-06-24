<%-- 
    Document   : wallet
    Created on : Jun 20, 2024, 9:21:07 AM
    Author     : Legion
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Pay to Wallet</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
            #monica-writing-entry-btn-root {
                ._monica-theme-d2f2b383 {
                    --theme-text-primary: #262626;
                    --theme-text-secondary: #404040;
                    --theme-text-tertiary: #595959;
                    --theme-text-quaternary: #8C8C8C;
                    --theme-text-disable: #BDBDBD;
                    --theme-text-white-primary: #FFFFFF;
                    --theme-text-white-secondary: #FFFFFF;
                    --theme-text-link: #1E6FFF;
                    --theme-text-link-active: #1E6FFF;
                    --theme-text-brand: #6841EA;

                    --theme-icon-primary: #222226;
                    --theme-icon-secondary: #3D3D43;
                    --theme-icon-tertiary: #55555D;
                    --theme-icon-quaternary: #868692;
                    --theme-icon-disable: #D9D9DD;
                    --theme-icon-white-primary: #FFFFFF;
                    --theme-icon-white-secondary: #FFFFFF;
                    --theme-icon-brand: #6841EA;

                    --theme-btn-fill-primary: #6841EA;
                    --theme-btn-fill-primary-hover: #9373FF;
                    --theme-btn-fill-primary-active: #522BD6;
                    --theme-btn-fill-secondary: #ECECEE;
                    --theme-btn-fill-secondary-hover: #F5F5F5;
                    --theme-btn-fill-secondary-active: #D9D9DD;
                    --theme-btn-fill-tertiary: #DFD5FE;
                    --theme-btn-fill-tertiary-hover: #F0EBFF;
                    --theme-btn-fill-tertiary-active: #B8A3FB ;
                    --theme-btn-border-primary: #4F59661F;
                    --theme-btn-border-secondary: #4F596614;

                    --theme-fill-tsp-components-primary: #4F59661F;
                    --theme-fill-tsp-components-secondary: #4F596614;
                    --theme-fill-tsp-components-tertiary: #4F59660A;
                    --theme-fill-btn-primary: #ECECEE;
                    --theme-fill-btn-secondary: #F5F5F5;
                    --theme-fill-white: #FFFFFF;
                    --theme-fill-tsp-blue: #185CEB14;
                    --theme-fill-tsp-brand: #6841EA14;
                    --theme-fill-tsp-brand-primary: #6841EABF;
                    --theme-fill-tsp-brand-secondary: #6841EA73;
                    --theme-fill-tsp-brand-tertiary: #6841EA3D;
                    --theme-fill-tsp-gray: #4F596652;
                    --theme-fill-black-none: #252528;


                    --theme-label-tsp-brand-primary: #6841EA1F;
                    --theme-label-tsp-brand-secondary: #6841EA14;


                    --theme-border-light: #4F596614;
                    --theme-border-primary: #4F59661F;
                    --theme-border-quaternary: #4F596633;
                    --theme-border-active: #6841EA;
                    --theme-border-white: #FFFFFF0A;

                    --theme-tab-fill: #4F596614;
                    --theme-tab-fill-active: #222226;

                    --theme-tooltips-fill: #000000D9;

                    --theme-bg-white: #FFFFFF;
                    --theme-bg-gray-primary: #F5F5F5;
                    --theme-bg-gray-secondary: #FAFAFA;
                    --theme-bg-mask: #00000073;
                    --theme-bg-menu-white: #FFFFFF;
                    --theme-bg-menu-gray: #F5F5F5;
                    --theme-bg-tsp-gray-primary: #F5F5F5E6;
                    --theme-bg-tsp-white-primary: #FFFFFF;
                    --theme-bg-gray-nav: #ececee;
                    --theme-bg-tsp-white-secondary: #FFFFFF73;

                    --theme-function-info: #3BBFFF;
                    --theme-function-success: #00AA5B;
                    --theme-function-warning: #FFAB00;
                    --theme-function-error: #EA3639;
                    --theme-function-error-border: #FFA4A3;
                    --theme-function-warning-light: #FDFAE9;
                    --theme-function-warning-border: #FFE266;

                    --theme-shadow-s1: rgba(0, 0, 0, 0.04);
                    --theme-shadow-s2: rgba(0, 0, 0, 0.08);
                    --theme-shadow-s3: rgba(0, 0, 0, 0.24);

                    --theme-box-shadow-s1: 0px 1px 20px 0px var(--theme-shadow-s1);
                    --theme-box-shadow-s2: 0px 8px 24px 0px var(--theme-shadow-s2), 0px 0px 1px 0px var(--theme-shadow-s2);
                    --theme-box-shadow-s3: 0px 12px 40px -4px var(--theme-shadow-s3), 0px 0px 2px 0px var(--theme-shadow-s2);

                }
                ._monica-theme-d2f2b383._monica-dark {
                    --theme-text-primary:  #F3F3F3;
                    --theme-text-secondary:  #DBDBDB;
                    --theme-text-tertiary:  #AAAAAA;
                    --theme-text-quaternary:  #7A7A7A;
                    --theme-text-disable:  #4C4C4C;
                    --theme-text-white-primary:  #E9EAED;
                    --theme-text-white-secondary:  #E9EAED;
                    --theme-text-link:  #5E8CFF;
                    --theme-text-link-active:  #3767EB;
                    --theme-text-brand:  #7F58FD;

                    --theme-icon-primary:  #F3F3F4;
                    --theme-icon-secondary:  #BFBFC4;
                    --theme-icon-tertiary:  #A7A7AE;
                    --theme-icon-quaternary:  #77777E;
                    --theme-icon-disable:  #4A4A4F;
                    --theme-icon-white-primary:  #F3F3F4;
                    --theme-icon-white-secondary:  #F3F3F4;
                    --theme-icon-brand:  #7F58FD;

                    --theme-btn-fill-primary:  #7F58FD;
                    --theme-btn-fill-primary-hover:  #8363E9;
                    --theme-btn-fill-primary-active:  #5E40BF;
                    --theme-btn-fill-secondary:  #56565F3D;
                    --theme-btn-fill-secondary-hover:  #56565F52;
                    --theme-btn-fill-secondary-active:  #56565F52;
                    --theme-btn-fill-tertiary:  #473386;
                    --theme-btn-fill-tertiary-hover:  #332560;
                    --theme-btn-fill-tertiary-active: #4F399A;
                    --theme-btn-border-primary:  #A2B1D733;
                    --theme-btn-border-secondary:  #A2B1D71F;

                    --theme-fill-tsp-components-primary:  #56565F52;
                    --theme-fill-tsp-components-secondary:  #56565F33;
                    --theme-fill-tsp-components-tertiary:  #56565F1F;
                    --theme-fill-btn-primary:  #2d2d2f;
                    --theme-fill-btn-secondary:  #252528;
                    --theme-fill-white:  #0000003D;
                    --theme-fill-tsp-blue:  #5E8CFF1F;
                    --theme-fill-tsp-brand:  #765AD01F;
                    --theme-fill-tsp-brand-primary:  #765AD0D9;
                    --theme-fill-tsp-brand-secondary: #765AD0A6;
                    --theme-fill-tsp-brand-tertiary: #765AD073;
                    --theme-fill-tsp-gray: #56565FA6;
                    --theme-fill-black-none: #2D2D2F;


                    --theme-label-tsp-brand-primary:  #765AD03D;
                    --theme-label-tsp-brand-secondary:  #765AD01F;


                    --theme-border-light:  #56565F33;
                    --theme-border-primary:  #56565F52;
                    --theme-border-quaternary:  #56565F73;
                    --theme-border-active:  #7F58FD;
                    --theme-border-white:  #FFFFFF0A;

                    --theme-tab-fill: #56565F1F;
                    --theme-tab-fill-active:  #77777E;

                    --theme-tooltips-fill:  #000000F2;

                    --theme-bg-white:  #202020;
                    --theme-bg-gray-primary:  #252528;
                    --theme-bg-gray-secondary:  #1B1B1D;
                    --theme-bg-mask:  #00000073;
                    --theme-bg-menu-white:  #282828;
                    --theme-bg-menu-gray:  #2D2D2F;
                    --theme-bg-tsp-gray-primary: #252528E6;
                    --theme-bg-tsp-white-primary:  #25272D;
                    --theme-bg-gray-nav: #2D2D2F;
                    --theme-bg-tsp-white-secondary: #0000003D;

                    --theme-function-info:  #0F76BC;
                    --theme-function-success:  #278056;
                    --theme-function-warning: #B07807;
                    --theme-function-error:  #8E2827;
                    --theme-function-error-border: #742525;
                    --theme-function-warning-light: #443518;
                    --theme-function-warning-border: #634B1B;

                    --theme-shadow-s1: rgba(0, 0, 0, 0.24);
                    --theme-shadow-s2: rgba(0, 0, 0, 0.32);
                    --theme-shadow-s3: rgba(0, 0, 0, 0.45);
                }
            }

        </style><style>
            .monica-writing-entry-btn-wrapper {
                position: absolute;
                right: 9px;
                bottom: 2px;
                pointer-events: all;
                user-select: none;
                -webkit-user-drag: none;
            }

            .monica-writing-entry-btn {
                position: relative;
                height: 28px;
                transition: all 0.2s ease-in-out;
                border-radius: 28px;
                background: var(--theme-bg-white);
                box-shadow: 0px 1px 4px 0px var(--theme-shadow-s2), 0px 0px 1px 0px var(--theme-shadow-s3);
                overflow: hidden;
            }

            .monica-writing-clickable-box {
                position: absolute;
                right: 0;
                bottom: 0;
                height: 100%;
                display: flex;
                align-items: center;
                gap: 2px;
            }

            .monica-writing-clickable-group {
                display: inline-flex;
                align-items: center;
                gap: 2px;
            }

            .monica-writing-clickable-item {
                cursor: pointer;
                user-select: none;
                -webkit-user-drag: none;
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: center;
                box-sizing: border-box;
                height: 24px;
                padding: 3px;
                border-radius: 12px;
                color: var(--theme-icon-disable);
                transition: all 0.2s ease-in-out;
            }

            .monica-writing-clickable-item-bg:hover {
                background: var(--theme-border-primary);
            }

            .monica-writing-clickable-item.monica-writing-off:hover {
                color: var(--theme-text-brand);
            }

            .monica-writing-clickable-item.monica-writing-writing {
                color: var(--theme-text-brand);
            }

            .monica-writing-clickable-item.monica-writing-open {
                color: var(--theme-text-brand);
                opacity: 0.75;
            }

            .monica-writing-divider {
                background-color: var(--theme-border-light);
                min-width: 1px;
                height: 12px;
            }


            .monica-writing-grammar-checking-content {
                min-width: 18px;
                height: 18px;
                display: flex;
                box-sizing: border-box;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                border-radius: 16px 16px 6px 16px;
                color: var(--theme-text-white-primary);
            }
            .monica-writing-grammar-checking-loading {
                background: var(--theme-icon-brand);
            }

            .monica-writing-tooltip_wrapper {
                z-index: 9999;
            }



            .monica-writing-grammar-checking-content.monica-writing-grammar-checking-has-result {
                background: var(--theme-function-error);
                padding: 2px;
            }

            .monica-writing-grammar-checking-content.monica-writing-grammar-checking-result-than-100 {
                border-radius: 16px 8px 3px 16px;
                padding: 2px;
            }

            .monica-writing-grammar-checking-result {
                color: var(--theme-text-white-primary);
                font-size: 12px;
                font-style: normal;
                font-weight: 700;
                line-height: 16px;
            }

            .monica-writing-grammar-checking-icon {
                animation: monica-writing-grammar-checking-icon-rotate 1s linear infinite;
            }

            @keyframes monica-writing-grammar-checking-icon-rotate {
                from {
                    transform: rotate(0deg);
                }
                to {
                    transform: rotate(360deg);
                }

            }


            .monica-writing-caret {
                width: 1.5px;
                background-color: var(--theme-border-active);
                pointer-events: none;
                position: absolute;
                border-radius: 1px;
            }
            .monica-writing-caret-head {
                background-color: var(--theme-border-active);
                width: 6px;
                height: 6px;
                border-radius: 6px;
                position: absolute;
                left: -2.25px;
            }
            @media print {
                .monica-writing-entry-btn {
                    display: none;
                }
            }

            .monica-writing-primary-btn {
                box-sizing: border-box;
                padding: 4px 8px;
                font-size: 14px;
                line-height: 24px;
                color: var(--theme-text-white-primary);
                background: var(--theme-btn-fill-primary);
                border-radius: 8px;
                display: flex;
                justify-content: center;
                align-items: center;
                cursor: pointer;
                transition: all 0.2s ease-in-out;
            }

            .monica-writing-primary-btn:hover {
                background: var(--theme-btn-fill-primary-hover);
            }

            .monica-writing-primary-btn:active {
                background: var(--theme-btn-fill-primary-active);
            }

            .monica-writing-text-btn {
                font-size: 14px;
                line-height: 24px;
                color: var(--theme-text-tertiary);
                cursor: pointer;
                transition: all 0.2s ease-in-out;
                padding: 4px 8px;
                border-radius: 8px;
                display: flex;
                justify-content: center;
                align-items: center;
                width: 100%;
            }

            .monica-writing-text-btn:hover,
            .monica-writing-text-btn:active {
                color: var(--theme-fill-tsp-components-secondary);
            }

            .monica-writing-gc-guide {
                position: absolute;
                right: 0;
                bottom: 30px;
                width: 300px;
                min-height: 100px;
                border-radius: 20px;
                background: var(--theme-bg-white);
                box-shadow: var(--theme-box-shadow-s1);
                padding: 16px;
                display: flex;
                flex-direction: column;
                gap: 12px;
                user-select: unset;
            }

            .monica-writing-gc-guide-header {
                display: flex;
                justify-content: space-between;
                gap: 12px;
            }

            .monica-writing-gc-guide-title {
                flex: 1;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                display: flex;
                align-items: center;
                gap: 4px;
            }

            .monica-writing-gc-guide-close {
                display: flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
                cursor: pointer;
                width: 24px;
                height: 24px;
                border-radius: 8px;
                color: var(--theme-text-quaternary);
            }

            .monica-writing-gc-guide-close:hover {
                background: var(--theme-fill-tsp-components-secondary);
            }

            .monica-writing-gc-guide-content {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .monica-writing-gc-guide-msg {
                font-size: 14px;
                line-height: 22px;
                color: var(--theme-text-primary);
            }

            .monica-writing-gc-guide-img {
                padding: 0 20px;
            }

            .monica-writing-gc-guide-img img {
                width: 100%;
                height: auto;
            }

            .monica-writing-gc-guide-footer {
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 8px;
            }

            .monica-writing-gc-guide-footer .monica-writing-primary-btn,
            .monica-writing-gc-guide-footer .monica-writing-subscribe-btn {
                width: 100%;
            }

            .monica-writing-gc-setting-guide {
                width: auto;
            }

            .monica-writing-gc-setting-guide .monica-writing-gc-guide-footer {
                align-items: flex-end;
            }

            .monica-writing-gc-setting-guide .monica-writing-primary-btn {
                width: auto;
                min-width: 60px;
            }

            .monica-writing-gc-guide-setting {
                color: var(--theme-text-brand);
                cursor: pointer;
            }

            .monica-writing-gc-guide-setting:hover {
                opacity: 0.8;
            }

        </style>
    </head>
    <body>
        <!-- Sidebar -->
        <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:15%">
            <h3 class="w3-bar-item">Setting</h3>
            <a href="#" class="w3-bar-item w3-button">Wallet</a>
            <a href="home" class="w3-bar-item w3-button">Back to Home</a>
        </div>

        <!-- Page Content -->
        <div style="margin-left:15%">

            <div class="w3-container w3-teal">
                <h1>My Wallet</h1>
            </div>

            <div class="container" style="margin: 0; width: 100%">
                <div class="content">
                    <h3>Add Money to Wallet</h3>
                    <div class="table-responsive">
                        <form action="payment" id="frmCreateOrder" method="post">    
                            <input type="hidden" name="type" value="wallet">
                            <div class="form-group">
                                <label for="Amount">Amount: </label>
                                <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="Amount" name="amount" type="text" value="10000">
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
                </div>
            </div>

        </div>

        <script src="js/bootstrap.min.js"></script>
    </body>
</html>