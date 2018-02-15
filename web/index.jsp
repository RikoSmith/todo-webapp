<%--
  Created by IntelliJ IDEA.
  User: riko
  Date: 2/7/18
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>

      <h1 id="name">TO-DO List</h1>
      <ul id="todo"></ul>
      <input id="item" type="text" name="newItem">
      <input type="submit" onclick="postExecute()"></input>

      <script>
          function onPageLoad() {
              var serv_request = new XMLHttpRequest ();
              serv_request.onreadystatechange = function(){
                  if ( serv_request.readyState == 4 && serv_request.status == 200) {
                      console . log (" Success !");
                      jo = JSON . parse ( serv_request . responseText );
                      console.log(jo);
                      text = jo.name ;
                      document . getElementById ("todo").innerHTML = "";
                      for(i = 0; i < jo.length; i++){
                          document . getElementById ("todo").innerHTML+= "<li>"+jo[i]+"</li>"
                      }

                  }
              }
              serv_request.open ('GET','data',true);
              serv_request.send(null);
          }

          function postExecute() {
              var item = document.getElementById("item").value;
              document.getElementById("item").value = "";
              var param = "newItem="+item;
              console.log("Sending " + param);
              var serv_request = new XMLHttpRequest ();
              serv_request.onreadystatechange = function(){
                  if ( serv_request.readyState == 4 && serv_request.status == 200) {
                      console.log("Received: "+ serv_request.responseText);
                      onPageLoad();
                  }
              }
              serv_request.open ('POST','data',true);
              serv_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
              serv_request.send(param);
          }

          onPageLoad();


      </script>
  </body>
</html>
