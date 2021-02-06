Course Outline
1. Setp Xcode, VScode, RESTFul Client, NodeJS 14.x        
2. New Project with Cocoa
3. Intro Http Network Programming
   - Http Protocol : [GET, POST, DELETE, PUT..]
   - HTTP GET vs POST   
   - What is RESTfulAPI?
   - URL, StringQuery, Parameter, HTTP Body, RAWJSON, Header
4. Test Http Target with POSTMan, VSCode RESTful, Curl
5. Intro Alamofire - https://github.com/Alamofire/Alamofire
6. JSONPlaceHolder https://jsonplaceholder.typicode.com/


Workshop
1. HTTPS: AF.request("https://google.com").responseString { (response) in
2. HTTP: AF.request("http://jsonplaceholder.typicode.com/posts").responseString { (response) in
3. HTTP GET Method: AF.request("http://jsonplaceholder.typicode.com/posts", method: .get).responseString { (response) in
4. HTTP POST Method: AF.request("http://jsonplaceholder.typicode.com/posts", method: .post, parameters: data).responseString { (response) in