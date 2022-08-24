//Member 클래스
Member = function(id,name,addr){
	this.id = id;
	this.name = name;
	this.addr = addr;
}

//클래스 안에 함수를 정의(setter)
Member.prototype.setValue = function(id,name,addr) {
	this.id = id;
	this.name = name;
	this.addr = addr;
}

//클래스 안에 함수를 정의(getter) getter - 매개변수 X
Member.prototype.getValue = function(){
	return "[" + this.id + "]" + this.name + "(" + this.addr + ")";
}