# PART 1: Sending Data to the server

## GET vs POST

Can you send data to a server via GET request? Yes you can!
The difference between the POST and GET request is that a GET request will append
the form data as part of the `query string` appended to the end of the URL.
This means a GET request might look like this:

`GET /hello/:name/:age/:job`

or this might also look familiar to you:

`GET /hello?name=nina&age=21&job=programmer`

## POST Request
POST requests send data through the request `body` instead of the URL. From the GET example
above, a POST request looks something like this:

```
POST /hello
Content-Type: application/x-www-form-urlencoded
Content-Length: 32

name=nina&age=21&job=programmer
```
The advantages of a POST request to send data are:
- request is never cached
- amount of data sent can be larger than GET requests
- sensitive data is not visible in the URL (think passwords)

The example `1-app.rb` file will show you how you would possible send data to your sinatra app.

