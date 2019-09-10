//[9,9,9,9,9,10,10,10,10,11,11,11,11,12,12,12,12,12,1,1]获取此数组中数字出现的次数
function countTimes(Array) {
    var data = [];
    const countOccurences = (arr, value) => arr.reduce((a, v) => v === value ? a + 1 : a + 0, 0);
    for (var i = 0; i < Array.length; i++) {
        var count = countOccurences(Array, Array[i]);
        var str = Array[i] + "-" + count;
        data.push(str);
    }
    var final_data = data.filter(function (ele, index, self) {
        return self.indexOf(ele) === index;
    });

    var result = [];

    for (var i = 0; i < final_data.length; i++) {
        var str1 = final_data[i].split("-");
        var times = parseInt(str1[1]);
        result.push(times);
    }
    return result;
}