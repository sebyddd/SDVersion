#include <iostream>
using namespace std;
int main()
{
int i,n,gasit=0;;
float a,x;
cout<<"n=";n=1;
cout<<"x=";x=1;

	for(i=1;i<=n;i++){
		cout<<"a=";cin>>a;
		if(a==x) gasit=1;
	}

	if (gasit==1) cout<<"numarul "<<x<<" se gaseste in sir";
	else cout<<"numarul "<<x<<" nu se gaseste in sir";

	return 0;
}