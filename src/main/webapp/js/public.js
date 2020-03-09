(

function readOnly() {
	$('input[name=dor_ad_id]').attr("readonly", "readonly")// 将input元素设置为readonly
})(function read() {
	$('input[name=dor_ad_id]').removeAttr("readonly");// 去除input元素的readonly属性
})(function confirm() {
	if (confirm("是否执行该操作？")) {
		return true;
	}
	return false;
})