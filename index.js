const PORT = 8090;
const express = require('express')

var app = express();
// 启动主服务器
app.listen(PORT,()=>{
    console.log('success')
})