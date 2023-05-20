<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="FoodOrdering.User.Blog" %>

<html>
    <head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="../TemplateFiles/images/favicon.png" type="">

  <title> FoodExpress </title>

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
<body >
       <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>

       <div class="hero_area1">
    <div class>
      <img src="" alt="">
    </div>
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
            <span>
              Food Express
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent"  >
            <ul class="navbar-nav  mx-auto  " height="300px" >
              <li class="nav-item ">
                <a class="nav-link" href="Default.aspx"  >Home <span class="sr-only">(current)</span></a>
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
                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
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
<%--<span class="badge rounded-pill bg-warning mb-4 "  >
                      <%Response.Write(Session["cartCount"]); %>
                  </span>--%>
                  <span class="badge rounded-pill bg-warning mb-4 "  >
                  </span>
              </a>
              <div class="form-inline">
                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                  <i class="fa fa-search" aria-hidden="true"></i>
                </button>
              </div>
            <%--  <a href="" class="order_online">
               <%-- Order Online
              </a>
                <asp:LinkButton ID="lblLogout" runat="server" CssClass="order_online" CausesValidation="false" OnClick="lblLogout_Click"></asp:LinkButton>--%>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->

  </div>
    <!-- Section: Design Block -->
<!-- Section: Design Block -->
<section class="text-center text-lg-start">
  

  <!-- Jumbotron -->
  <div class="container py-4">
    <div class="row g-0 align-items-center">
      <div class="col-lg-6 mb-5 mb-lg-0">
        <div class="card cascading-right" style="
            background: hsla(0, 0%, 100%, 0.55);
            backdrop-filter: blur(30px);
            ">
          <div class="card-body p-5 shadow-5 text-center">
            <h2 class="fw-bold mb-5">Create Blog </h2>
               <form runat="server">
              <!-- 2 column grid layout with text inputs for the first and last names -->
              <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline">
                    <asp:TextBox ID="txtTopic" class="form-control" runat="server" ></asp:TextBox>
                    <label class="form-label" for="topic">Topic</label>
                  </div>
                </div>

                <div class="col-md-6 mb-4">
                  <div class="form-outline">
                      <asp:FileUpload ID="file" runat="server" />
                    <label class="form-label" for="file">Image</label>
                  </div>
                </div>
              </div>

              <!-- Blog input -->
              <div class="form-outline mb-4">
                <textarea id="recognizedTextArea" rows="10" cols="50"></textarea><br />
                <label class="form-label" for="form3Example3">Blog</label>
              </div>

              <!-- create buttons -->
              <div class="text-center">
                <asp:Button  id="createBlog" class="btn btn-success btn-floating mx-1 border-radius: 12px; btn-block mt-4" Text="Create Blog" runat="server" OnClick="createBlog_Click" />
              </div>
        </form>

              <!-- Submit button -->
                <input type="button" id="btnStart" class="btn btn btn-warning border-radius: 12px;" value="Start Recognition" onclick="startRecognition()" />
    <input type="button" id="btnStop" class="btn btn-danger border-radius: 12px;" value="Stop Recognition" onclick="stopRecognition()" disabled="disabled" /><br />


          </div>
        </div>
      </div>

      <div class="col-lg-6 mb-5 mb-lg-0">
         <img src="../TemplateFiles/images/about-img.png" class="w-100 rounded-4 shadow-4"
          alt="" />
      </div>
    </div>
  </div>

    </section>
   
    <script type="text/javascript">
        var recognition;
        var recognizedTextArea = document.getElementById("recognizedTextArea");
        var isProcessing = false;

        function startRecognition() {
            recognition = new webkitSpeechRecognition();
            recognition.continuous = true;
            //recognition.interimResults = true;

            recognition.onresult = function (event) {
                if (!isProcessing) {
                    isProcessing = true;

                    var recognizedText = '';
                    for (var i = event.resultIndex; i < event.results.length; ++i) {
                        if (event.results[i].isFinal) {
                            recognizedText += event.results[i][0].transcript;
                        } else {
                            recognizedText += event.results[i][0].transcript;
                        }
                    }

                    recognizedTextArea.value += recognizedText;

                    // Send the recognized text to the server using AJAX
                    $.ajax({
                        type: "POST",
                        url: "Blog.aspx/ProcessRecognizedText",
                        data: JSON.stringify({ recognizedText: recognizedTextArea.value }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            console.log("Recognized text saved to database.");
                        },
                        error: function (xhr, status, error) {
                            console.log("Error sending recognized text to server: " + error);
                        },
                        complete: function () {
                            isProcessing = false;
                        }
                    });
                }
            };

            recognition.start();
            document.getElementById('btnStart').disabled = true;
            document.getElementById('btnStop').disabled = false;
        }

        function stopRecognition() {
            recognition.stop();
            //recognizedTextArea.value = '';
            document.getElementById('btnStart').disabled = false;
            document.getElementById('btnStop').disabled = true;
        }

    </script>
<!-- Section: Design Block -->
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
