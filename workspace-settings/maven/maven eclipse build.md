```
현재 메이븐 빌드시 빌드 결과가 바로바로 target 에 적용되지 않는 문제가 있음
[eclipse-menu]project - clean -> maven clean -> maven build(war:inplace) -> project refresh
으로 해결됨.

[maven build goals]
war:inplace
war:war
war:deploy

[maven rebuild process]
maven build | clean:clean | target, webapp/WEB-INF 모두 clean
project clean | project build | maven clean 후 프로젝트가 자동으로 빌드되지 않아서 -> 해결: maven build | compile.
maven build | war:inplace, deploy
```