<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConvertTextToSpeech.aspx.cs" Inherits="FoodOrdering.User.ConvertTextToSpeech" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Voice Recognition Example</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <input type="button" id="btnStart" class="btn btn-success border-radius: 12px;" value="Start Recognition" onclick="startRecognition()" />
    <input type="button" id="btnStop" class="btn btn-danger border-radius: 12px;" value="Stop Recognition" onclick="stopRecognition()" disabled="disabled" />

    <br />
    <textarea id="recognizedTextArea" rows="10" cols="50"></textarea>
    <form runat="server">
        <asp:Button runat="server" Text="Create Blog" id="blog" OnClick="blog_Click"/>
    </form>

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
                        url: "ConvertTextToSpeech.aspx/ProcessRecognizedText",
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
            recognizedTextArea.value ='';
            document.getElementById('btnStart').disabled = false;
            document.getElementById('btnStop').disabled = true;
        }

    </script>
</body>
</html>
