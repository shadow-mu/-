# fetch

```js
let wtf=fetch('https://dog.ceo/api/breeds/image/random');
console.log(wtf)
```

![image-20220517121208614](img/image-20220517121208614.png)

```js
fetch('https://dog.ceo/api/breeds/image/random')
then(response =console.log(response ))
```

![image-20220517121314499](img/image-20220517121314499.png)

```js
fetch('https://dog.ceo/api/breeds/image/random')
then(response =console.log(response.json()));
```

```js
fetch('https://dog.ceo/api/breeds/image/random')
.then(response =response.json())
then(data =console.Log(data))
```

