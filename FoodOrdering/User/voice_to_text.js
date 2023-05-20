click_to_record.addEventListener('click', function () {
    var speech = true;
    window.SpeechRecognition = window.webkitSpeechRecognition;

    const recognition = new SpeechRecognition();
    recognition.interimResults = true;

    recognition.addEventListener('result', e => {
        const transcript = Array.from(e.results)
            .map(result => result[0])
            .map(result => result.transcript)
            .join('');

        document.getElementById("convert_text").innerHTML = transcript;
        console.log(transcript);
      

    });

    if (speech == true) {
        recognition.start();
    }
})

// Get a reference to the convert_text element
const convertTextElement = document.getElementById("convert_text");

// Add an event listener for the click event on the submit button
document.getElementById("submit_button").addEventListener("click", function () {
    // Get the inner HTML of the convert_text element
    const convertText = convertTextElement.innerHTML;

    // Create a new AJAX request to send the convertText data to the server
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "blog.aspx");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onload = function () {
        if (xhr.status === 200) {
            // Handle the response from the server
            const responseText = xhr.responseText;
            console.log(responseText);
        } else {
            console.log("Request failed. Status: " + xhr.status);
        }
    };
    xhr.send("convertText=" + encodeURIComponent(convertText));
});



