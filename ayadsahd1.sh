<!DOCTYPE html>
<html>
<head>
  <title>Hacker Camera</title>
  <style>
    body {
      background-color: black;
      color: #00ff00;
      font-family: monospace;
      text-align: center;
      padding-top: 50px;
    }

    h1 {
      font-size: 35px;
    }

    button {
      background: black;
      color: #00ff00;
      border: 1px solid #00ff00;
      padding: 10px 20px;
      cursor: pointer;
      margin-top: 20px;
    }

    video {
      margin-top: 20px;
      border: 2px solid #00ff00;
      display: none;
    }

    #loading {
      display: none;
      margin-top: 20px;
    }

    .blink {
      animation: blink 1s infinite;
    }

    @keyframes blink {
      0% {opacity: 1;}
      50% {opacity: 0;}
      100% {opacity: 1;}
    }
  </style>
</head>

<body>

<h1>ACCESS TERMINAL</h1>
<p>Initializing system<span class="blink">...</span></p>

<button onclick="startHack()">START</button>

<div id="loading">Accessing camera<span class="blink">...</span></div>

<br>
<video id="video" width="300" autoplay></video>

<script>
function startHack() {
  document.getElementById("loading").style.display = "block";

  setTimeout(() => {
    navigator.mediaDevices.getUserMedia({ video: true })
      .then(stream => {
        document.getElementById('video').style.display = "block";
        document.getElementById('video').srcObject = stream;
      })
      .catch(() => {
        alert("Permission denied!");
      });
  }, 2000);
}
</script>

</body>
</html>
