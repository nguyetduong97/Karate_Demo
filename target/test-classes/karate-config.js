function() {    //Javascript

//JSON object
  var config =  {
    name: "Demo",
    baseUrl: 'http://localhost:8080'
  }

   //Logging Statement

  var env = karate.env
  karate.log("Env is: ", env);

  if(env=='local'){
    config.baseUrl = 'http://localhost:8080/local'
  }

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  //return JSON object
  return config;
}