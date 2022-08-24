이클립스 min.js 파일때문에 나타나는 프로젝트 에러표시 없애기

```
1) Project->Properties->JavaScript->Include Path->Source
2) Inclusion and Exclusion Patterns 창에서 Exclusion patterns Add 버튼 클릭
3) 상황에 적합한 패턴 입력 (예 : **/jquery*.js ) 
4) 적용시키면 에러 표시 제거됨
```