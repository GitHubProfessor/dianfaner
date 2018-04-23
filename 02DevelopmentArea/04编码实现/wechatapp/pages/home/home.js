//index.js
//获取应用实例
const app = getApp()

Page({
    data:{
        imgUrls: [
            'http://img.taopic.com/uploads/allimg/140729/240450-140HZP45790.jpg',
            'http://img06.tooopen.com/images/20160818/tooopen_sy_175866434296.jpg',
            'http://img06.tooopen.com/images/20160818/tooopen_sy_175833047715.jpg'
        ],
        foods:[]
    },
    onLoad: function () {
        // 页面渲染后 执行
        wx.request({
            url: 'http://localhost:8089/food?restaurant=&name=&pageNum=1&pageSize=10&total=0',
            data: {
               
            },
            // header: {
            //     'content-type': 'application/json' // 默认值
            // },
            success:(res)=>{
                console.log(res.data.list)
                this.setData({ foods: res.data.list })
            }
        })
    },
    addFood: function (event){
        console.log(event.target.dataset.id)
        
    },
    toDetail:function(){
        wx.redirectTo({
            url: '/pages/detail/detail'
        })
    },
    toShoppingCard: function () {
        wx.navigateTo({
            url: '/pages/myfoods/myfoods'
        })
    }
})