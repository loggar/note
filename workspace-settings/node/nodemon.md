
install nodemon 

```
npm install nodemon -g
```

node 대신 nodemon 으로 실행하면 파일 수정시 자동으로 적용된다. 브라우저만 새로고침하면 된다.

js 파일 수정시에만 적용된다/ html 파일 수정시 재시작되지 않는 점 확인.

```
C:\_workspace\ex_js>nodemon server_js_tutorial.js
```


eclipse 에 추가

```
-g 로 설치한 nodemon 을 C:\Users\webnl\AppData\Roaming\npm 에서 C:\_dev\nodejs\node_modules\npm 으로 디렉토리에 맞추어 복사했다.

eclipse 에서 js 파일 실행시 Run configuration > (Tab)Arguments > Node Arguments 에 다음 내용 추가
C:\_dev\nodejs\node_modules\npm\node_modules\nodemon\bin\nodemon.js
```
