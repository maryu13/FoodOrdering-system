<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chat.aspx.cs" Inherits="FoodOrdering.User.chat" %>

<!DOCTYPE html>
<html>
<head>
    <title>Chatbot</title>
    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="../TemplateFiles/css/bootstrap.css" />

    <!--owl slider stylesheet -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
    <!-- nice select  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
    <!-- font awesome style -->
    <link href="../TemplateFiles/css/font-awesome.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="../TemplateFiles/css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="../TemplateFiles/css/responsive.css" rel="stylesheet" />
    <!-- jQery -->
    <script src="../TemplateFiles/js/jquery-3.4.1.min.js"></script>
    <%--<script type="text/javascript">
        $(document).ready(function () {
            $("#send-btn").click(function () {
                var message = $("#input-msg").val();
                $.ajax({
                    type: "POST",
                    url: "chat.aspx/GetResponse",
                    data: JSON.stringify({ message: message }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var chat = $("#chat-box");
                        var message = $("<div class='message'></div>").text(response.d);
                        chat.append(message);
                        $("#input-msg").val("");
                    },
                    error: function () {
                        alert("Error getting response from server.");
                    }
                });
            });
        });
    </script>--%>
    <script>
        $(document).ready(function () {
            $("#messages").on("keyup", function () {

                if ($("#messages").val()) {
                    $("#send").css("display", "block");
                } else {
                    $("#send").css("display", "none");
                }
            });
        });

        $(document).ready(function () {
            $("#send").click(function () {
                var message = $("#messages").val();
                $userMessage = $("#messages").val();
                $appendUserMessage = '<div class="chat usersMessages">' + $userMessage + '</div>';
                $("#messageDisplaySection").append($appendUserMessage);

                $.ajax({
                    type: "POST",
                    url: "chat.aspx/GetResponse",
                    data: JSON.stringify({ message: message }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        //var chat = $("#chat-box");
                        //var message = $("<div class='message'></div>").text(response.d);
                        //chat.append(message);

                        $appendBotResponse = '<div id="messagesContainer"><div class="chat botMessages">' + response.d + '</div></div>';
                        $("#messageDisplaySection").append($appendBotResponse);
                        $("#messages").val("");
                    },
                    error: function () {
                        alert("Error getting response from server.");
                    }
                });

                $("#messages").val("");
                $("#send").css("display", "none");
            });
        });

    </script>

    <style>
        #container {
            padding: 0;
            margin: 0;
            font-family: sans-serif;
            box-sizing: border-box;
        }

        #container {
            height: 100vh;
            width: 100%;
            position: relative;
            display: grid;
            place-items: center;
            background: #1f0033;
            overflow: hidden;
        }

        /* #dot1 {
            height: 500px;
            width: 900px;
            position: absolute;
            top: -200px;
            right: -200px;
            background: #fc86ab;
            border-radius: 50%;
        }

        #dot2 {
            height: 500px;
            width: 900px;
            position: absolute;
            bottom: -200px;
            left: -200px;
            background: #17e782;
            border-radius: 50%;
        }*/

        #screen {
            height: 630px;
            width: 1000px;
            margin-left: 210px;
            border-radius: 30px;
            background: #f6f6f6;
            border-radius: 25px;
            border: 15px solid #fff;
            box-shadow: 3px 3px 15px rgba(0,0,0,0.2);
            position: relative;
            overflow: hidden;
        }

        #header {
            height: 80px;
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
            background: #1f0033;
            display: grid;
            place-items: center;
            font-size: 25px;
            color: #fff;
            font-weight: bold;
            text-shadow: 1px 1px 2px #000000a1;
        }

        #messageDisplaySection {
            height: 450px;
            width: 100%;
            position: absolute;
            left: 0;
            top: 100px;
            padding: 0 20px;
            overflow-y: auto;
        }

        .chat {
            min-height: 40px;
            max-width: 60%;
            padding: 15px;
            border-radius: 10px;
            margin: 15px 0;
        }

        .botMessages {
            background: #8f53b5;
            color: #fff;
            text-shadow: 1px 1px 2px #000000d4;
        }

        #messagesContainer {
            height: auto;
            width: 100%;
            display: flex;
            justify-content: flex-end;
        }

        .usersMessages {
            background: #00000010;
        }

        #userInput {
            height: 50px;
            width: 90%;
            position: absolute;
            left: 5%;
            bottom: 3%;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
        }

        #messages {
            height: 50px;
            width: 90%;
            position: absolute;
            left: 0;
            border: none;
            outline: none;
            background: transparent;
            padding: 0px 15px;
            font-size: 17px;
        }

        #send {
            height: 50px;
            width: 24%;
            position: absolute;
            right: 0;
            border: none;
            outline: none;
            display: grid;
            place-items: center;
            color: #fff;
            font-size: 20px;
            background: #1f0033;
            cursor: pointer;
            display: none;
        }
    </style>


    <script>
        $(function () {
            //this will get the full url at the address bar
            var url = window.location.href;

            //passes in every "a" tag
            $("#navbarSupportedContent a").each(function () {
                //cheecks if its the same on the address bar
                if (url == (this.href)) {
                    $(this).closest("li").addClass("active");
                }
            });
        });
    </script>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Open+Sans:wght@400;600;700&display=swap");
        .navbar-brand {
    font-family: 'Dancing Script', cursive;
}

        .custom_nav-container {
            padding: 0;
        }

            .custom_nav-container .navbar-nav .nav-item .nav-link {
                padding: 5px 20px;
                color: black;
                text-align: center;
                text-transform: uppercase;
                border-radius: 5px;
                -webkit-transition: all 0.3s;
                transition: all 0.3s;
            }

        .navbar-brand span {
            font-weight: bold;
            font-size: 32px;
            color: black;
        }

        .custom_nav-container .nav_search-btn {
            width: auto;
            height: auto;
            padding: 0;
            border: none;
            color: black;
            margin: 0 10px;
        }

        .user_option .user_link {
            color: black;
        }

        .user_option .cart_link svg {
            width: 17px;
            height: auto;
            fill: white;
            margin-bottom: 2px;
        }

        .user_option .order_online {
            display: inline-block;
            padding: 8px 30px;
            background-color: black;
            color: white;
            border-radius: 45px;
            -webkit-transition: all 0.3s;
            transition: all 0.3s;
            border: none;
        }

        .user_option a {
            margin: 0 10px;
        }

        .user_option .user_link {
            color: black;
        }

            .user_option .user_link:hover {
                color: #ffbe33;
            }

        .user_option .cart_link {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
        }

            .user_option .cart_link svg {
                width: 17px;
                height: auto;
                fill: black;
                margin-bottom: 2px;
            }

            .user_option .cart_link:hover svg {
                fill: #ffbe33;
            }

        .user_option .order_online {
            display: inline-block;
            padding: 8px 30px;
            background-color: black;
            color: black;
            border-radius: 45px;
            -webkit-transition: all 0.3s;
            transition: all 0.3s;
            border: none;
        }

            .user_option .order_online:hover {
                background-color: #e69c00;
            }
    </style>

    <style>
        .cascading-right {
            margin-right: -50px;
        }

        @media (max-width: 991.98px) {
            .cascading-right {
                margin-right: 0;
            }
        }
    </style>

</head>
<body>
    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>

    <div class="hero_area1">
        <%--  <div class>
            <img src="" alt="">
        </div>--%>
    
    <!-- header section strats -->
    <header class="header_section">
        <div class="container">
            <nav class="navbar navbar-expand-lg custom_nav-container ">
                <a class="navbar-brand" href="index.html">
                    <span>Food Express
                    </span>
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class=""></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav  mx-auto  " height="300px">
                        <li class="nav-item ">
                            <a class="nav-link" href="Default.aspx">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Menu.aspx">Menu</a>
                        </li>
                         <li class="nav-item">
                <a class="nav-link" href="Blog.aspx">Blog</a>
              </li>
                 <li class="nav-item">
                <a class="nav-link" href="BlogView.aspx">BlogView</a>
              </li>
                 <li class="nav-item">
                <a class="nav-link" href="chat.aspx">Chatbot</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="About.aspx">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Contact.aspx">Contact</a>
              </li>
                    </ul>
                    <div class="user_option">
                        <a href="" class="user_link">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </a>
                        <a class="cart_link" href="Cart.aspx">
                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background: new 0 0 456.029 456.029;" xml:space="preserve">
                                <g>
                                    <g>
                                        <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                   c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                   C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                   c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                   C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                   c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                    </g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                                <g>
                                </g>
                            </svg>

                            <span class="badge rounded-pill bg-warning mb-4 "></span>
                        </a>
                        <div class="form-inline">
                            <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </div>
                        <%--<a href="" class="order_online">
                Order Online
              </a>--%>
                        <%-- <asp:LinkButton ID="lblLogout" runat="server" CssClass="order_online" CausesValidation="false" OnClick="lblLogout_Click"></asp:LinkButton>--%>
                    </div>
                </div>
            </nav>
        </div>
    </header>
        </div>
    <!-- end header section -->
    <div>
        <div id="dot1"></div>
        <div id="dot2"></div>
        <div id="screen">
            <div id="header">ONLINE CHATBOT</div>
            <div id="messageDisplaySection">
                <!-- bot messages -->
                <!-- <div class="chat botMessages">Hello there, how can I help you?</div> -->

                <!-- usersMessages -->
                <!-- <div id="messagesContainer">
                <div class="chat usersMessages">I need your help to build a website.</div>
            </div> -->
            </div>
            <!-- messages input field -->
            <div id="userInput">
                <input type="text" name="messages" id="messages" autocomplete="OFF" placeholder="Type Your Message Here." required>
                <input type="submit" value="Send" id="send" name="send">
            </div>
        </div>
    </div>
     <footer class="footer_section">
    <div class="container">
      <div class="row">
        <div class="col-md-4 footer-col">
          <div class="footer_contact">
            <h4>
              Contact Us
            </h4>
            <div class="contact_link_box">
              <a href="">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <span>
                  Location
                </span>
              </a>
              <a href="">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>
                  Call +01 1234567890
                </span>
              </a>
              <a href="">
                <i class="fa fa-envelope" aria-hidden="true"></i>
                <span>
                  demo@gmail.com
                </span>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <div class="footer_detail">
            <a href="" class="footer-logo">
              Food Express
            </a>
            <p>
             Food is symbolic of love when words are inadequate.
            </p>
            <div class="footer_social">
              <a href="">
                <i class="fa fa-facebook" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-twitter" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-linkedin" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-instagram" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-pinterest" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <h4>
            Opening Hours
          </h4>
          <p>
            Everyday
          </p>
          <p>
            10.00 Am -10.00 Pm
          </p>
        </div>
      </div>
      <div class="footer-info">
        <p>
          &copy; <span id="displayYear"></span> All Rights Reserved By
          <a href="https://html.design/"</a><br><br>
          &copy; <span id="displayYear"></span> Distributed By
          <a href="https://themewagon.com/" target="_blank"></a>
        </p>
      </div>
    </div>
  </footer>
  <!-- footer section -->
    

  
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="../TemplateFiles/js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="../TemplateFiles/js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->
</body>
</html>


