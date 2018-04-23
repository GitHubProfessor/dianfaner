//index.js
//获取应用实例
const app = getApp()

Page({
    data: {
        imgUrls: [
        'http://img.taopic.com/uploads/allimg/140729/240450-140HZP45790.jpg',
        'http://img06.tooopen.com/images/20160818/tooopen_sy_175866434296.jpg',
        'http://img06.tooopen.com/images/20160818/tooopen_sy_175833047715.jpg'
        ],
    },
    toR: function () {
        wx.redirectTo({
            url: '/pages/home/home',
        })
    },
    toMap: function () {
        wx.showActionSheet({
            itemList:['a', 'b']
        })
    }
})