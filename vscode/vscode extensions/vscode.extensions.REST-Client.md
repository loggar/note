# vscode extensions: REST Client

`vscode.extensions.rest-client.req.http`

```
# Sample of Rest-Client

POST http://localhost:3000/users HTTP/1.1
content-type: application/json

{
	"__v": 0,
	"_id": "abcd1234efgh5678",
	"name": "John Doe",
	"email": "john@doe.com",
	"password": "samplepassword"
}


###
POST http://localhost:3000/users HTTP/1.1
content-type: application/json

{
	"__v": 0,
	"_id": "abcd1234efgh5679",
	"name": "John2 Doe",
	"email": "john2@doe.com",
	"password": "samplepassword"
}

###
GET http://localhost:3000/users


###
GET http://localhost:3000/users/abcd1234efgh5678


###
PUT http://localhost:3000/users/abcd1234efgh5678
content-type: application/json

{
	"__v": 0,
	"_id": "abcd1234efgh5678",
	"name": "John3 Doe",
	"email": "john3@doe.com",
	"password": "samplepassword"
}

###
DELETE http://localhost:3000/users/abcd1234efgh5679


```

`vscode.extensions.rest-client.curl.http`

```
curl \
	--request GET \
	--url http://localhost:27010

###

curl \
	-X POST \
	-H "Content-Type: application/x-www-form-urlencoded" \
	-d "description=running node server on android system" \
	--url http://localhost:27010/todo
```
