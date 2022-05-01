var x = [1,1,2,1];
var xcopy = x.slice();
var counter = 0;

for (var i in x) {
	if (i == x[i]) {
		xcopy.splice(i-counter , 1);
		counter++;
	}
}

document.writeln(xcopy);

document.writeln(x);